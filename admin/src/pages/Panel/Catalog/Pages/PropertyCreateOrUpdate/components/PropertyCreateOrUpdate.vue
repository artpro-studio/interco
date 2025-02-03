<script lang="ts" setup>
    import {computed, createApp, onMounted, ref, Ref} from 'vue';
    import {
        CreateProductPropertyesDto,
        CreateProductPropertyesDtoType,
        getApiClientInitialParams,
        ProdcutPropertyesOptionsDto,
        PropertyControllerClient,
        PropertyLinkControllerClient,
        ResponsePropertyesDto,
        Result,
    } from 'src/ApiClient/ApiClient';
    import useValidationRules from 'src/helpers/useValidationRules';
    import {useQuasar} from 'quasar';
    import {RouterName} from 'src/router/routerName';
    import {useRoute, useRouter} from 'vue-router';
    import FormButtons from '/src/components/UI/FormButtons.vue';
    import PropertyListKey from './PropertyListKey.vue';
    import {ITypeSelect, ITypeSelectData} from 'pages/Panel/Catalog/Pages/PropertyCreateOrUpdate/interface';
    import ModalsInfo from 'components/Modals/ModalsInfo.vue';
    import PropertyList from 'pages/Panel/Catalog/Pages/PropertyCreateOrUpdate/components/PropertyList.vue';
    import PropertyOptionAndFile
        from 'pages/Panel/Catalog/Pages/PropertyCreateOrUpdate/components/PropertyOptionAndFile.vue';

    const app = createApp({});
    app.component('FormButtons', FormButtons)
        .component('PropertyListKey', PropertyListKey);
    const { isRequired } = useValidationRules();
    const $q = useQuasar();
    const router = useRouter();
    const route = useRoute();

    const api = new PropertyControllerClient(getApiClientInitialParams());
    const isEdit: Ref<boolean> = ref(false);
    let id: Ref<number | null> = ref(null);

    const formRef: Ref<any> = ref(null);
    const form: Ref<CreateProductPropertyesDto> = ref({
        id: null,
        name: '',
        code: '',
        type: CreateProductPropertyesDtoType.Text,
        isFilter: false,
        options:[],
        multi: false,
        isCommercial: false,
    });
    let oldForm: CreateProductPropertyesDto | null = null;
    const isChange: Ref<boolean> = ref(false);
    const typSelectData: ITypeSelect[] = ITypeSelectData;

    const isViewOption = computed((): boolean => {
        return form.value.type === CreateProductPropertyesDtoType.List
            || form.value.type === CreateProductPropertyesDtoType.ListKey
            || form.value.type === CreateProductPropertyesDtoType.Color;
    });
    // Запрос на создание и обновления свойства
    const createOrUpdate = async () => {
        if (form.value && form.value.options) {
            form.value.options = form.value.options.filter((el: ProdcutPropertyesOptionsDto) => el.code && el.value);
        }
        const result = await api.create(form.value);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Раздел создан'
            });

            router.push({
                name: RouterName.CatalogProperty,
            });
        }
    };

    // Когда пользователь подтвержадет сохранение с удалением ссылок
    const successChange = async () => {
        const result: Result = await new PropertyLinkControllerClient(getApiClientInitialParams()).deleteLinoOfProperty(form.value.id!.toString());
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            createOrUpdate();
        }
    };
    // Сохранение формы и валидация
    const saveForm = () => {
        formRef.value!.validate().then(async (success: boolean) => {
            if (success) {
                // Проверяем было ли изменено множественное свойство
                if (form.value.id && form.value.multi !== oldForm?.multi) {
                    isChange.value = true;
                    return;
                }
                createOrUpdate();
            }
        });
    };
    // Удаление свойства
    const deleteItem = async () => {
        const result: ResponsePropertyesDto = await api.delete(id.value!.toString());
        if (result.isSuccess) {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Свойство удалено'
            });
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        }

        router.push({name: RouterName.CatalogProperty});
    };

    // Получение товара
    const getDetailInfo = async () => {
        console.log('id.value', id.value);
        const result: ResponsePropertyesDto = await api.getOne(id!.value!.toString());
        if (!result.isSuccess && !result.entity) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        } else {
            form.value = result.entity!;
            oldForm = {...result.entity!};
        }
    };

    const changePropertyListKey = (event: ProdcutPropertyesOptionsDto[]) => {
        form.value.options = event;
    };

    onMounted(() => {
        if (route.name === RouterName.CatalogPropertyEdit) {
            id.value = Number(route.params.id);
            isEdit.value = true;
            getDetailInfo();
        }
    });
</script>
<template>
    <div>
        <div class="product-create form-edit">
            <q-card class="section-create-form">
                <q-card-section>
                    <q-form  ref="formRef">
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.name"
                                label="Название"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.code"
                                label="Символьный код"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-select
                                outlined
                                v-model="form.type"
                                :options="typSelectData"
                                option-value="value"
                                option-label="text"
                                label="Тип"
                                emit-value
                                map-options
                            />
                        </div>
                        <div class="section-create-form__field row q-gutter-md">
                            <q-toggle
                                color="secondary"
                                v-model="form.isFilter"
                                label="Показывать в фильтре?"
                            />
                            <q-toggle
                                color="secondary"
                                v-model="form.multi"
                                label="Множественное поле"
                            />
                            <q-toggle
                                color="secondary"
                                v-model="form.isCommercial"
                                label="Учавствуте в торговом предложении?"
                            />
                        </div>
                    </q-form>
                </q-card-section>
            </q-card>
            <h4 class="text-h4 q-mt-lg" v-if="isViewOption">Опции</h4>
            <q-card class="q-mt-lg" v-if="isViewOption">
                <q-card-section>
                    <property-list-key
                        v-if="form.type === CreateProductPropertyesDtoType.ListKey"
                        :form="form"
                        @change="changePropertyListKey"
                    />
                    <property-list
                        v-if="form.type === CreateProductPropertyesDtoType.List"
                        :form="form"
                        @change="changePropertyListKey"
                    />
                    <property-option-and-file
                        v-if="form.type === CreateProductPropertyesDtoType.Color"
                        :form="form"
                        @change="changePropertyListKey"
                    />
                </q-card-section>
            </q-card>
            <q-btn
                class="q-mt-lg"
                v-if="isEdit"
                color="negative full"
                @click="deleteItem"
                outline
            >Удалить свойства</q-btn>
        </div>
        <form-buttons @success="saveForm" />

        <q-dialog v-model="isChange">
            <modals-info
                title="Подтвердите действие"
                text="Вы точно хотите изменить тип множественого поля, при изменении все связи товаров удалятся"
                @on-success="successChange"
            />
        </q-dialog>
    </div>
</template>

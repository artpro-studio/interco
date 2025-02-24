<script lang="ts" setup>
    import { getApiClientInitialParams, ILangPages, PagesDto, PagesSectionsControllerClient, PagesSectionsDto } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import useValidationRules from '@/helpers/useValidationRules';
    import { QForm, useQuasar } from 'quasar';
    import { onMounted, ref } from 'vue';

    interface IProps {
        id?: number | null;
        page: PagesDto;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close']);

    const $q = useQuasar();
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { isRequired } = useValidationRules();
    const { resultError } = useResultException();

    const api = new PagesSectionsControllerClient(getApiClientInitialParams());

    const isLoading = ref(false);
    const formRef = ref(null);
    const form = ref<PagesSectionsDto>({
        id: null,
        title: [
            {
                lang: ILangPages.RuRU,
                value: '',
            },
            {
                lang: ILangPages.EnUS,
                value: '',
            },
            {
                lang: ILangPages.ZhCN,
                value: '',
            },
        ],
        description: [
            {
                lang: ILangPages.RuRU,
                value: '',
            },
            {
                lang: ILangPages.EnUS,
                value: '',
            },
            {
                lang: ILangPages.ZhCN,
                value: '',
            },
        ],
    });
    const formErrors = ref<Record<string, string>>({
    });

    const onUpdate = async () => {
        const result = await api.update(form.value);
        if (!result.isSuccess) {
            resultError(result, formErrors.value);
            return false;
        }
        return true;
    };

    const onCreate = async () => {
        const result = await api.create(form.value);
        if (!result.isSuccess) {
            resultError(result, formErrors.value);
            return false;
        }
        return true;
    };

    const onChange = () => {
        (formRef.value! as QForm).validate().then(async (success: boolean) => {
            if (success) {
                form.value.pages = props.page;
                let result = false;
                if (props.id) {
                    result = await onUpdate();
                } else {
                    result = await onCreate();
                }
                if (result) {
                    $q.notify({
                        color: 'positive',
                        textColor: 'white',
                        icon: 'check',
                        message: !props.id ? 'Информационный блок создан' : 'Информационный блок изменен',
                    });
                }

                emit('on-close');
            }
        });
    };

    const getInfo = async () => {
        isLoading.value = true;
        const result = await api.getOne(props.id!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = {
                ...result.entity!,
                pages: props.page,
            };
        }
        isLoading.value = false;
    };

    onMounted(() => {
        if (props.id) {
            getInfo();
        }
    });
</script>

<template>
    <div class="q-pa-md flex flex-center" v-if="isLoading">
        <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
    </div>
    <q-card class="create-update-pages-params" v-else>
        <q-card-section>
            <q-btn icon="close" class="create-update-pages-params__close" @click="emit('on-close')" round></q-btn>
            <div class="create-update-pages-params__header q-mb-lg">
                <h4 class="text-h4">{{ props.id ? 'Редактирование' : 'Создание' }}</h4>
            </div>
            <q-form ref="formRef" @submit="onChange">
                <div class="section-create-form__field">
                    <div class="text-h5 q-mb-md">Название</div>
                    <div class="section-create-form__field__body row no-wrap q-gutter-md q-mb-md">
                        <div
                            v-for="(item, index) in form.title"
                            :key="index"
                            class="section-create-form__field__input"
                        >
                            <q-input
                                v-model="item.value"
                                color="primary"
                                :label="item.lang?.toString()"
                                :rules="[isRequired]"
                                outlined
                            />
                        </div>
                    </div>

                </div>
                <div class="section-create-form__field q-mb-md">
                    <div class="text-h5 q-mb-md">Описание</div>
                    <div
                        v-for="(item, index) in form.description"
                        :key="index"
                    >
                        <q-input
                            type="textarea"
                            v-model="item.value"
                            class="q-mb-md"
                            color="primary"
                            :label="item.lang?.toString()"
                            :rules="[isRequired]"
                            outlined
                        />
                    </div>
                </div>
                <div class="create-update-pages-params__buttons">
                    <q-btn type="submit" color="primary" class="full">{{ props.id ? 'Сохранить' : 'Создать' }}</q-btn>
                </div>
            </q-form>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .create-update-pages-params {
        min-width: 700px;

        @media (max-width: 700px) {
            min-width: auto;
            width: 100%;
        }

        &__close {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    }
    .section-create-form {
        &__field {
            &__input {
                width: calc(33.3333% - 16px);
            }
        }
    }
</style>

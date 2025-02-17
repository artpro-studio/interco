<script lang="ts" setup>
    import {
        getApiClientInitialParams,
        IIblockField,
        PagesIblockControllerClient,
        PagesIBlockFieldsDto,
        PagesIblockRecordsControllerClient,
        PagesIblockSectionDto,
    } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import useValidationRules from '@/helpers/useValidationRules';
    import { QForm, useQuasar } from 'quasar';
    import { onMounted, ref } from 'vue';
    import RecordsFieldArray from './records-fields/RecordsFieldArray.vue';
    import RecordsFieldImage from './records-fields/RecordsFieldImage.vue';

    interface IProps {
        id?: number | null;
        iblockID: number;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close']);

    const $q = useQuasar();
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { isRequired } = useValidationRules();
    const { resultError } = useResultException();

    const api = new PagesIblockRecordsControllerClient(getApiClientInitialParams());
    const apiIblock = new PagesIblockControllerClient(getApiClientInitialParams());

    const isLoading = ref(true);
    const formRef = ref(null);
    const fields = ref<PagesIBlockFieldsDto[]>([]);
    const form = ref<Record<string, any>>({
        sort: 0,
        sections: [],
    });
    const formErrors = ref<Record<string, string>>({
        name: '',
        slug: '',
        type: '',
        isFilter: '',
    });
    const optionsSections = ref<PagesIblockSectionDto[]>([]);

    const getNameField = (key: string): string => {
        const find = fields.value.find((el) => el.slug === key);
        return find?.name || '';
    };

    const getTypeField = (key: string): IIblockField | null => {
        const find = fields.value.find((el) => el.slug === key);
        return find?.type ? find.type : null;
    };

    const onUpdate = async () => {
        const result = await api.update({
            iblockID: props.iblockID,
            data: form.value,
        });
        if (!result.isSuccess) {
            resultError(result, formErrors.value);
            return false;
        }
        return true;
    };

    const onCreate = async () => {
        const result = await api.create({
            iblockID: props.iblockID,
            data: form.value,
        });
        if (!result.isSuccess) {
            resultError(result, formErrors.value);
            return false;
        }
        return true;
    };

    const onChange = () => {
        (formRef.value! as QForm).validate().then(async (success: boolean) => {
            if (success) {
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
                ...result.entity,
                fields: {
                    ...form.value.fields,
                    ...result.entity.fields,
                },
                sections: result.entity.sections?.map((el: any) => {
                    return {
                        ...el,
                        field: el.value?.map((item: any) => `${item.lang}: ${item.value}`).join(',')
                    };
                }) || []
            };
        }
        isLoading.value = false;
    };

    const getFileds = async () => {
        const result = await apiIblock.getFields('', 1, 100, props.iblockID);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            fields.value = result.entity?.entity || [];
            form.value = {
                sort: 0,
                fields: {},
            };
            fields.value.forEach((el: PagesIBlockFieldsDto) => {
                form.value.fields[el.slug] = {};
                const labels = el.label?.sort((a: any, b: any) => a.id - b.id) || [];
                labels.forEach((label) => {
                    form.value.fields[el.slug][label.lang!] = {
                        lang: label.lang,
                        value: '',
                    };
                });
            });
        }
    };

    const getSections = async () => {
        const result = await apiIblock.getSections(props.iblockID);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            optionsSections.value = result.entity?.map((el) => {
                return {
                    ...el,
                    field: el.value?.map((item) => `${item.lang}: ${item.value}`).join(',')
                };
            }) || [];
        }
    };

    onMounted(async () => {
        await getFileds();
        await getSections();
        if (props.id) {
            getInfo();
        } else {
            isLoading.value = false;
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
                <q-input v-model="form.sort" color="primary" label="Порядок" class="q-mb-lg full" outlined />
                <q-select
                    v-model="form.sections"
                    label="Разделы"
                    :options="optionsSections"
                    option-value="id"
                    option-label="field"
                    class="q-mb-md"
                    use-chips
                    map-options
                    multiple
                    outlined
                />
                <div v-for="(item, key) in form.fields" :key="key" class="section-create-form__field q-mb-lg">
                    <div class="text-h5 q-mb-md">{{ getNameField(key.toString()) }}</div>
                    <div class="row no-wrap q-gutter-md records__fields">
                        <template v-if="getTypeField(key.toString()) === IIblockField.Text">
                            <div v-for="(field, fieldKey) in item" :key="fieldKey" class="records__fields__item">
                                <q-input v-model="form.fields[key][fieldKey].value" color="primary" :label="fieldKey.toString()" outlined />
                            </div>
                        </template>
                        <template v-if="getTypeField(key.toString()) === IIblockField.Array">
                            <records-field-array :field="item" @on-change="form.fields[key] = $event" />
                        </template>
                        <template v-if="getTypeField(key.toString()) === IIblockField.Image">
                            <records-field-image :field="item" @on-change="form.fields[key] = $event" />
                        </template>
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
    .records {
        &__fields {
            &__item {
                min-width: calc(33.3333% - 16px);
                max-width: calc(33.3333% - 16px);
                width: calc(33.3333% - 16px);
            }
        }
    }
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
</style>

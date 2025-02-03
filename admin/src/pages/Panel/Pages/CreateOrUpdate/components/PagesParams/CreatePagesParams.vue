<script lang="ts" setup>
    import { CreatePagesParamsDto, getApiClientInitialParams, ITypePagesParams, PagesParamsControllerClient } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import useValidationRules from '@/helpers/useValidationRules';
    import { QForm, useQuasar } from 'quasar';
    import { onMounted, ref } from 'vue';
    import { optionsTypePagesParams } from './interface';

    interface IProps {
        id?: number | null;
        pagesId: number;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close']);

    const $q = useQuasar();
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { isRequired } = useValidationRules();
    const { resultError } = useResultException();

    const api = new PagesParamsControllerClient(getApiClientInitialParams());

    const isLoading = ref(false);
    const formRef = ref(null);
    const form = ref<CreatePagesParamsDto>({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        name: '',
        slug: '',
        type: ITypePagesParams.Text,
        isFilter: false,
        pagesId: null,
    });
    const formErrors = ref<Record<string, string>>({
        name: '',
        slug: '',
        type: '',
        isFilter: '',
    });
    const optionsType = optionsTypePagesParams;

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
                form.value.pagesId = props.pagesId;
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
                        message: !props.id ? 'Парамметр создан' : 'Парамметр изменен',
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
                pagesId: props.pagesId,
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
                <h4 class="text-h4">{{ props.id ? 'Редактирование парамметра' : 'Создание парамметра' }}</h4>
            </div>
            <q-form ref="formRef" @submit="onChange">
                <div class="section-create-form__field q-mb-md">
                    <q-input
                        v-model="form.name"
                        color="primary"
                        label="Название"
                        :rules="[isRequired]"
                        :error="!!formErrors.name"
                        :error-message="formErrors.name"
                        outlined
                    />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-input
                        v-model="form.slug"
                        color="primary"
                        label="Символьный код"
                        :rules="[isRequired]"
                        :error="!!formErrors.slug"
                        :error-message="formErrors.slug"
                        outlined
                    />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-select
                        v-model="form.type"
                        :options="optionsType"
                        option-label="name"
                        option-value="value"
                        :rules="[isRequired]"
                        :error="!!formErrors.type"
                        :error-message="formErrors.type"
                        map-options
                        emit-value
                        outlined
                    />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-checkbox
                        v-model="form.isFilter"
                        color="primary"
                        label="Использовать в фильтре?"
                        :error="!!formErrors.isFilter"
                        :error-message="formErrors.isFilter"
                    />
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
</style>

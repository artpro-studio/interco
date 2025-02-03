<script lang="ts" setup>
    import { QForm, useQuasar } from 'quasar';
    import {
        getApiClientInitialParams,
        SettingsContactsControllerClient,
        SettingsContactsDto,
    } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { onMounted, ref, Ref } from 'vue';

    const { isRequired } = useValidationRules();
    const { resultError } = useResultException();

    const emit = defineEmits(['close', 'success']);

    const $q = useQuasar();

    const props: {
        id: number | null;
        isPhone: boolean;
    } = defineProps({
        id: {
            type: Number,
            required: false,
        },
        isPhone: {
            type: Boolean,
            default: false,
        },
    });

    const formRef = ref(null);
    const form: Ref<SettingsContactsDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        content: '',
        description: '',
        isPhone: props.isPhone,
    });
    const formErrors: Ref<Record<string, string>> = ref({
        content: '',
        description: '',
    });

    const onUpdate = async () => {
        const result = await new SettingsContactsControllerClient(getApiClientInitialParams()).update(form.value);
        if (!result.isSuccess) {
            resultError(result, formErrors.value);
        } else {
            emit('success', result.entity);
        }
    };

    const onCreate = async () => {
        const result = await new SettingsContactsControllerClient(getApiClientInitialParams()).create(form.value);
        if (!result.isSuccess) {
            resultError(result, formErrors.value);
        } else {
            emit('success', result.entity);
        }
    };

    const onChange = () => {
        (formRef.value! as QForm).validate().then((success: boolean) => {
            if (success) {
                if (props.id) {
                    onUpdate();
                } else {
                    onCreate();
                }
            } else {
                $q.notify({
                    color: 'negative',
                    textColor: 'white',
                    icon: 'warning',
                    message: 'Заполните форму',
                });
            }
        });
    };

    const getInfo = async () => {
        const result = await new SettingsContactsControllerClient(getApiClientInitialParams()).getOne(props.id);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity!;
        }
    };

    onMounted(() => {
        if (props.id) {
            getInfo();
        }
    });
</script>

<template>
    <q-card class="settings-content-create">
        <div class="settings-content-create__close">
            <q-btn icon="close" @click="emit('close')" round></q-btn>
        </div>
        <q-card-section>
            <div class="settings-content-create__header q-mb-lg">
                <h4 class="text-h4">{{ props.id ? 'Изменение' : 'Добавление' }}</h4>
            </div>
            <q-form ref="formRef" class="settings-content-create__form q-mt-md" @submit="onChange">
                <div class="settings-content-create__form__field q-mb-sm">
                    <q-input
                        v-model="form.content"
                        label="Контент"
                        :rules="[isRequired]"
                        :error-message="formErrors.content"
                        :error="!!formErrors.content"
                        outlined
                        :mask="props.isPhone ? '+7 (###) ### - ## ##' : ''"
                    />
                </div>
                <div class="settings-content-create__form__field">
                    <q-input
                        v-model="form.description"
                        label="Описание"
                        :rules="[isRequired]"
                        :error-message="formErrors.description"
                        :error="!!formErrors.description"
                        outlined
                    />
                </div>
                <div class="settings-content-create__form__button q-mt-md">
                    <q-btn type="submit" class="settings-content-create__btn full" color="primary"> Сохранить </q-btn>
                </div>
            </q-form>
        </q-card-section>
    </q-card>
</template>
<style lang="scss">
    .settings-content-create {
        min-width: 400px;
        position: relative;

        &__close {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 2;
        }

        &__button {
            width: 100%;

            button {
                width: 100%;
            }
        }

        &__btn {
            width: 100%;
        }
    }
</style>

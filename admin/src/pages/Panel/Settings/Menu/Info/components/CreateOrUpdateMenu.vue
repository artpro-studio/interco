<!-- eslint-disable vue/script-indent -->
<script lang="ts" setup>
    import {
        CreateSettingsMenuItemDto,
        getApiClientInitialParams,
        SettingsMenuItemControllerClient,
    } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import useValidationRules from '@/helpers/useValidationRules';
    import { QForm, useQuasar } from 'quasar';
    import { onMounted, ref, Ref } from 'vue';
    import SelectsPages from '@/components/UI/Selects/SelectsPages.vue';

    interface IProps {
        id?: number | null;
        parentId?: number | null;
        idMenu: number;
    }

    const emit = defineEmits(['on-close', 'on-success']);
    const props = defineProps<IProps>();

    const $q = useQuasar();
    const { isRequired } = useValidationRules();
    const { resultError } = useResultException();

    const api = new SettingsMenuItemControllerClient(getApiClientInitialParams());
    const formRef = ref(null);
    const form: Ref<CreateSettingsMenuItemDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        title: '',
        hash: '',
        order: 0,
        menuId: props.idMenu,
        parentId: props.parentId,
        pagesDropDown: null,
    });
    const formErrors: Ref<Record<string, string>> = ref({
        title: '',
        hash: '',
        order: '',
    });

    const onUpdate = async () => {
        const result = await api.update(form.value);
        if (!result.isSuccess) {
            resultError(result, formErrors.value);
        } else {
            emit('on-success', result.entity);
        }
    };

    const onCreate = async () => {
        const result = await api.create({
            ...form.value,
        });
        if (!result.isSuccess) {
            resultError(result, formErrors.value);
        } else {
            emit('on-success', result.entity);
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
        const result = await api.getOne(props.id!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = {
                ...form.value,
                ...result.entity,
                pagesDropDown: result.entity?.pages
                    ? {
                          value: result.entity.pages.id!,
                          label: result.entity.pages.name,
                      }
                    : null,
            };
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
            <q-btn icon="close" @click="emit('on-close')" round></q-btn>
        </div>
        <q-card-section>
            <div class="settings-content-create__header q-mb-lg">
                <h4 class="text-h4">{{ props.id ? 'Изменение пункта' : 'Добавление пункта' }}</h4>
            </div>
            <q-form ref="formRef" class="settings-content-create__form q-mt-md" @submit="onChange">
                <div class="settings-content-create__form__field q-mb-sm">
                    <q-input
                        v-model="form.title"
                        label="Наименование"
                        :rules="[isRequired]"
                        :error-message="formErrors.content"
                        :error="!!formErrors.content"
                        outlined
                    />
                </div>
                <div class="settings-content-create__form__field q-mb-lg">
                    <selects-pages v-model="form.pagesDropDown" @input="form.pagesDropDown = $event" />
                </div>
                <div class="settings-content-create__form__field">
                    <q-input
                        v-model="form.hash"
                        label="Хеш"
                        :error-message="formErrors.hash"
                        :error="!!formErrors.hash"
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

<script lang="ts" setup>
    import { onMounted, ref } from 'vue';
    import Editor from 'src/components/Editor/Editor.vue';
    import useValidationRules from '@/helpers/useValidationRules';
    import { CreatePagesCommentsDto, DropDownDto, getApiClientInitialParams, PagesCommentsControllerClient, RecordsControllerClient } from '@/ApiClient/ApiClient';
    import { QForm, useQuasar } from 'quasar';
    import useResultException from '@/helpers/useResultException';
    import SelectsUsers from '@/components/UI/Selects/SelectsUsers.vue';
    import SelectsDropDown from '@/components/UI/Selects/SelectsDropDown.vue';
    import SelectsCommentStatus from './Selects/SelectsCommentStatus.vue';

    interface IProps {
        id?: number | null;
        recordsId?: number;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close']);

    const $q = useQuasar();
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { isRequired } = useValidationRules();
    const { resultError } = useResultException();

    const api = new PagesCommentsControllerClient(getApiClientInitialParams());
    const apiDropDownRecords = new RecordsControllerClient(getApiClientInitialParams());

    const formRef = ref(null);
    const form = ref<CreatePagesCommentsDto>({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        content: '',
        records: null,
        user: null,
    });
    const formErrors = ref<Record<string, string>>({
        content: '',
        records: '',
        users: '',
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
                        message: !props.id ? 'Комментарий создан' : 'Комментарий изменен',
                    });
                }

                emit('on-close');
            }
        });
    };

    const getInfo = async () => {
        const result = await api.getOne(props.id!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            let user: DropDownDto | null = null;
            let records: DropDownDto | null = null;
            if (result.entity?.user) {
                user = {
                    value: Number(result.entity?.user?.id),
                    label: `${result.entity?.user?.lastName} ${result.entity?.user?.firstName} ${result.entity?.user?.middleName}`,
                };
            }
            if (result.entity?.records) {
                records = {
                    value: Number(result.entity?.records?.id),
                    label: result.entity?.records?.title!.toString(),
                };
            }
            form.value = {
                ...(result.entity as CreatePagesCommentsDto),
                user,
                records,
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
    <q-card class="comments-create-or-update">
        <q-card-section>
            <q-btn icon="close" class="comments-create-or-update__close" @click="emit('on-close')" round></q-btn>
            <div class="comments-create-or-update__header q-mb-lg">
                <h4 class="text-h4">{{ props.id ? 'Редактирование комментария' : 'Создание комментария' }}</h4>
            </div>
            <q-form ref="formRef" @submit="onChange">
                <div class="section-create-form__field q-mb-md">
                    <editor :model-value="form.content" @update="form.content = $event" :error-message="formErrors.content" :error="!!formErrors.content" />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <selects-comment-status v-model="form.status" />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <selects-users :value="form.user" @update-model="form.user = $event" />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <selects-drop-down :api="apiDropDownRecords" label="Записи" :value="form.records" @update-model="form.records = $event" />
                </div>
                <div class="comments-create-or-update__buttons">
                    <q-btn type="submit" color="primary" class="full">{{ props.id ? 'Сохранить' : 'Создать' }}</q-btn>
                </div>
            </q-form>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .comments-create-or-update {
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

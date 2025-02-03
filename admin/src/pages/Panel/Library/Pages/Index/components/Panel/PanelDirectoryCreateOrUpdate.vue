<script lang="ts" setup>
    import { QForm } from 'quasar';
    import { CreateLibraryFilesDto, FileType, LibraryFilesControllerClient, getApiClientInitialParams } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { onMounted, PropType, Ref, ref } from 'vue';

    const { resultError } = useResultException();
    const { isRequired } = useValidationRules();

    const emit = defineEmits(['on-close']);

    const props: {
        directory: CreateLibraryFilesDto | null;
    } = defineProps({
        directory: {
            type: Object as PropType<CreateLibraryFilesDto | null>,
        },
    });

    const formRef = ref(null);
    const form: Ref<CreateLibraryFilesDto> = ref({
        id: null,
        type: FileType.Directory,
        path: null,
        name: '',
        parent: null,
        document: null,
    });

    const onChange = () => {
        (formRef.value! as InstanceType<typeof QForm>).validate().then(async (success: boolean) => {
            if (success) {
                const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).create(form.value);
                if (!result.isSuccess) {
                    resultError(result, null);
                } else {
                    emit('on-close');
                }
            }
        });
    };

    onMounted(() => {
        if (props.directory) {
            form.value.parent = props.directory;
        }
    });
</script>

<template>
    <q-card class="panel-directory-create-or-update-components">
        <q-card-section>
            <div class="panel-load-file-components__header q-mb-md row items-center justify-between">
                <div class="text-h4">Создание директории</div>
                <q-btn icon="close" @click="emit('on-close')" round></q-btn>
            </div>
            <q-form ref="formRef" class="panel-directory-create-or-update-components__form" @submit="onChange">
                <q-input v-model="form.name" label="Название директории" :rules="[isRequired]" outlined />
            </q-form>
            <q-btn type="submit" color="primary" class="q-mt-md full" @click="onChange">Сохранить</q-btn>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .panel-directory-create-or-update-components {
        min-width: 400px;
    }
</style>

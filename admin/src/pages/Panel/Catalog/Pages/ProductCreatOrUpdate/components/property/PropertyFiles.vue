<script lang="ts" setup>
    import {
        CreateDropzoneDto,
        FullPropertyLinksDto,
        getApiClientInitialParams,
        PropertyLinkControllerClient,
        PropertyLinksValuesDto,
        Result,
        ResultLinkOptionsDto,
    } from 'src/ApiClient/ApiClient';
    import { computed, createApp, PropType, toRefs } from 'vue';
    import DropzoneMain from 'src/components/Dropzone/Dropzone.vue';
    import { useQuasar } from 'quasar';
    import { IMockFile } from 'components/Dropzone/interface';

    const $q = useQuasar();
    const app = createApp({});
    app.component('DropzoneMain', DropzoneMain);

    const emit = defineEmits(['delete']);

    const props: {
        // ID товара
        id: number;
        item: FullPropertyLinksDto;
    } = defineProps({
        id: {
            required: true,
            type: Number,
        },
        item: {
            required: true,
            type: Object as PropType<FullPropertyLinksDto>,
        },
    });

    const { item } = toRefs(props);

    const files = computed((): CreateDropzoneDto[] => {
        const localFiles: CreateDropzoneDto[] = [];
        props.item.value!.forEach((el: PropertyLinksValuesDto) => {
            if (el.path) {
                localFiles.push(el.path);
            }
        });
        return localFiles;
    });

    // Запрос на удалении значения
    const queryDelete = async (id: number) => {
        const result: Result = await new PropertyLinkControllerClient(getApiClientInitialParams()).deleteOptions(
            id.toString()
        );
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            item.value.value = item.value.value!.filter((el) => el.id !== id);
        }
    };

    const removeFile = (file: IMockFile) => {
        const findItem: PropertyLinksValuesDto | undefined = props.item.value!.find(
            (el) => el.path?.id === file.fileId
        );
        if (findItem) {
            queryDelete(findItem.id!);
        }
    };

    const deleteProperty = async () => {
        emit('delete', item.value.id);
    };

    const addItem = async (file: CreateDropzoneDto) => {
        const result: ResultLinkOptionsDto = await new PropertyLinkControllerClient(
            getApiClientInitialParams()
        ).createOptions({
            id: props.item.id!,
            value: {
                id: null,
                value: '',
                option: null,
                path: file,
                name: '',
            },
        });
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            item.value.value!.push(result.entity);
        }
    };

    const addFile = (file: CreateDropzoneDto) => {
        addItem(file);
    };
</script>

<template>
    <q-card class="property-files-components section-create-form">
        <q-card-section>
            <div class="property-textarea-components__header q-mb-lg row items-center justify-between">
                <h4 class="text-h5">{{ props.item.productProperty?.name }}</h4>

                <q-icon
                    v-if="props.item.id"
                    name="delete"
                    size="20px"
                    class="property-files-components__icon cursor-pointer"
                    @click="deleteProperty"
                ></q-icon>
            </div>
            <dropzone-main id="propertyFiles" :files-props="files" @on-add-file="addFile" @delete-file="removeFile" />
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .property-files-components {
        &__icon {
            color: var(--q-gray-light);
            transition: 0.4s all;

            &:hover {
                color: var(--q-negative);
            }
        }
    }
</style>

<script lang="ts" setup>
    import { nextTick, onMounted, onUnmounted, ref } from 'vue';
    import DropzonaPreview from './DropzonaPreview.vue';
    import LibraryDropzona from './components/LibraryDropzona.vue';
    import { useQuasar } from 'quasar';

    interface IProps {
        isMultiple?: boolean;
        uploadUrl?: string;
        files?: any;
        isSelectFile?: boolean;
    }
    const props = withDefaults(defineProps<IProps>(), {
        uploadUrl: '/api/library-files/upload',
        isMultiple: false,
    });
    const emit = defineEmits(['on-delete-file', 'on-add-file']);

    const $q = useQuasar();

    const isLoading = ref(true);
    const tab = ref('dropzona');
    const isOpenLibrary = ref(false);
    const dropZonaInputRef: any = ref(null);
    const isDrag = ref(false);
    const localFiles: any = ref([]);
    const events = ref(['dragenter', 'dragover', 'dragleave', 'drop']);

    const onAddFile = (file: File) => {
        const arrPreview = ['image/png', 'image/jpeg', 'image/jpg'];
        localFiles.value.push({
            id: null,
            filename: file.name,
            url: arrPreview.indexOf(file.type) !== -1 ? URL.createObjectURL(file) : null,
            data: file,
        });
    };

    const onInput = (event: any) => {
        if (!props.isMultiple && localFiles.value.length) {
            return;
        }
        if (event.target.files.length) {
            for (const item of event.target.files) {
                onAddFile(item);
            }
        }
    };

    const onDrop = (e: DragEvent) => {
        if (e.dataTransfer && e.dataTransfer.files.length) {
            if (!props.isMultiple && localFiles.value.length) {
                isDrag.value = false;
                return;
            }
            for (const item of e.dataTransfer.files) {
                onAddFile(item);
            }

            isDrag.value = false;
        }
    };

    const onUpdateFile = (event: { index: number; file: any }) => {
        localFiles.value[event.index] = event.file;
        (dropZonaInputRef.value as any).files = null;
        (dropZonaInputRef.value as any).value = null;
        if (!props.isMultiple) {
            emit('on-add-file', localFiles.value[0]);
        } else {
            emit('on-add-file', localFiles.value);
        }
    };

    const onDeleteFile = (e: any) => {
        localFiles.value = localFiles.value.filter((el) => el.id !== e.id);
        emit('on-delete-file', e);
    };

    const openAddFile = () => {
        if (!props.isMultiple && localFiles.value.length) {
            return;
        }
        dropZonaInputRef.value.click();
    };

    const onPushFile = (file: any) => {
        if (!props.isMultiple && localFiles.value.length) {
            $q.notify({
                message: 'Нельзя добавить несколько файлов',
                color: 'negative',
            });
            closeLibrary();
            return;
        }

        localFiles.value.push(file);
        closeLibrary();
    };

    const onArrayPushFiles = (files: any) => {
        localFiles.value.push(...files);
        closeLibrary();
    };

    const changeTab = (event: string) => {
        isOpenLibrary.value = event === 'library' ? true : false;
    };

    const closeLibrary = () => {
        isOpenLibrary.value = false;
        tab.value = 'dropzona';
    };

    onMounted(() => {
        if (!props.isMultiple) {
            localFiles.value = [props.files] || [];
        } else {
            localFiles.value = props.files || [];
        }
        localFiles.value = props.files || [];
        events.value.forEach((eventName) => {
            document.body.addEventListener(eventName, (e: Event) => e.preventDefault());
        });
        nextTick(() => {
            isLoading.value = false;
        });
    });

    onUnmounted(() => {
        events.value.forEach((eventName) => {
            document.body.removeEventListener(eventName, (e: Event) => e.preventDefault());
        });
    });
</script>
<template>
    <q-tabs v-if="props.isSelectFile" v-model="tab" class="text-primary" inline-label @update:model-value="changeTab">
        <q-tab name="dropzona" icon="file_download" label="Загрузка" />
        <q-tab name="library" icon="collections" label="Выбрать из библиотеки" />
    </q-tabs>
    <q-tab-panels v-model="tab">
        <q-tab-panel class="dropzona__q-tab-panel" name="dropzona">
            <div
                v-if="!isLoading"
                class="dropzona"
                dropzone="copy"
                :class="[{ 'is-drag': isDrag }, { 'is-files': files.length }]"
                @drop.prevent="onDrop"
                @dragover="isDrag = true"
                @dragleave="isDrag = false"
            >
                <input ref="dropZonaInputRef" class="dropzona__input" type="file" :multiple="isMultiple" @input="onInput" />
                <div class="dropzona__body" :class="{ 'no-flex': files.length }">
                    <div class="dropzona__wrap">
                        <div v-if="localFiles.length" class="dropzona__preview">
                            <DropzonaPreview
                                v-for="(item, index) in localFiles"
                                :key="item.id"
                                :file="item"
                                :index="index"
                                :upload-url="uploadUrl"
                                @on-delete="onDeleteFile"
                                @update-file="onUpdateFile"
                            />
                            <div v-if="props.isMultiple" class="dropzona__preview__button" @click="openAddFile">
                                <q-icon name="add" size="30px" color="#999999" class="dropzona__preview__button__icon" />
                            </div>
                        </div>
                        <div v-else class="dropzona__no-items" @click="openAddFile">
                            <q-icon name="file_download" size="64px" class="dropzona__icon" />
                            <div class="dropzona__text">Перетащите файлы в зону загрузки или выберите файлы на вашем компьютере</div>
                            <q-btn color="primary" size="small" class="dropzona__btn" flat>Выбрать файлы</q-btn>
                        </div>
                    </div>
                </div>
            </div>
        </q-tab-panel>
    </q-tab-panels>
    <q-dialog v-model="isOpenLibrary" class="dialog-library" @hide="closeLibrary" full-width full-height>
        <library-dropzona :is-multiple="props.isMultiple" @on-add-file="onPushFile" @on-add-file-all="onArrayPushFiles" @on-close="closeLibrary" />
    </q-dialog>
</template>
<style lang="scss" scoped>
    .dropzona {
        border: 1px dashed #999999;
        border-radius: 8px;

        &__q-tab-panel {
            padding: 0;
        }

        &.is-drag {
            border: 1px dashed $primary;
        }
        &__input {
            display: none;
        }
        &__body {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            width: 100%;
            min-height: 250px;
            padding: 11px;
            &.no-flex {
                display: block;
            }
        }
        &__icon {
            color: #e2e2e3;
        }
        &__text {
            margin-bottom: 16px;
            color: #000;
            font-size: 14px;
        }
        &__btn {
            margin: 0 auto;
        }
        &__preview {
            display: flex;
            flex-wrap: wrap;
            &__button {
                width: 180px;
                height: 200px;
                margin: 9px;
                padding: 16px;
                padding-top: 10px;
                text-align: left;
                position: relative;
                cursor: pointer;
                background-color: #f2f6fc;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 8px;
                &__icon {
                    color: #999999 !important;
                }
                &:hover {
                    .dropzona__preview__button__icon {
                        color: #676a6c !important;
                    }
                }
            }
        }
    }
</style>

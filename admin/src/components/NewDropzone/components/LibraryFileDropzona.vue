<script lang="ts" setup>
    import { CreateLibraryFilesDto, FileType, LibraryFilesControllerClient, getApiClientInitialParams } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { computed, onMounted, ref, Ref, toRefs } from 'vue';
    import { useRoute } from 'vue-router';
    import ModalInfo from '@/components/Modals/ModalsInfo.vue';
    import ContentView from '@/components/ContentView/ContentView.vue';

    interface IProps {
        file: CreateLibraryFilesDto;
        isSelectMode: boolean;
        selectIds?: number[];
        isMultiple?: boolean;
    }

    const props = defineProps<IProps>();
    const emit = defineEmits(['on-chenge-router', 'on-update', 'on-select', 'on-remove-select', 'on-click']);

    const route = useRoute();
    const { resultError } = useResultException();

    const { file } = toRefs(props);
    const isDelete: Ref<boolean> = ref(false);
    const isOpenView: Ref<boolean> = ref(false);
    const isEdit: Ref<boolean> = ref(false);
    const editName: Ref<string> = ref('');

    const getNameIcon = computed((): string => {
        let iconName = '';
        switch (file.value.type) {
            case FileType.Images:
                iconName = 'image';
                break;
            case FileType.Directory:
                iconName = 'folder';
                break;
            case FileType.Audio:
                iconName = 'music_note';
                break;
            case FileType.Docs:
                iconName = 'description';
                break;
            case FileType.Video:
                iconName = 'smart_display';
                break;
            case FileType.Pdf:
                iconName = 'picture_as_pdf';
                break;
            case FileType.File:
                iconName = 'insert_drive_file';
                break;
        }

        return iconName;
    });

    const getColorIcon = computed((): string => {
        let iconColor = '';
        switch (file.value.type) {
            case FileType.Images:
                iconColor = '#41b983';
                break;
            case FileType.Directory:
                iconColor = '#faad42';
                break;
            case FileType.Audio:
                iconColor = '#0398e2';
                break;
            case FileType.Docs:
                iconColor = '#336cb0';
                break;
            case FileType.Video:
                iconColor = '#e62964';
                break;
            case FileType.Pdf:
                iconColor = '#e62964';
                break;
            case FileType.File:
                iconColor = '#f8bc3c';
                break;
        }

        return iconColor;
    });

    const isSelect = computed(() => {
        if (props.selectIds) {
            return !!props.selectIds.find((el: number) => el === file.value.id);
        }

        return false;
    });

    const onSelect = () => {
        if (isSelect.value) {
            emit('on-remove-select', file.value.id);
        } else {
            emit('on-select', file.value);
        }
    };

    const onClick = () => {
        if (props.isSelectMode) {
            onSelect();
            return;
        }
        if (isEdit.value) {
            return;
        }
        if (file.value.type === FileType.Directory) {
            emit('on-chenge-router', file.value.id);
        } else {
            emit('on-click', file.value);
        }
    };

    const onDelete = async () => {
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).delete(file.value.id!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            isDelete.value = false;
            emit('on-update');
        }
    };

    const updateName = async () => {
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).update(file.value.id!, editName.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            file.value.name = editName.value;
        }
    };

    const closeEdit = async (e: any) => {
        if (!(e.target! as HTMLElement).classList.contains('library-file-components__edit__textarea')) {
            if (editName.value !== file.value.name) {
                await updateName();
            }
            isEdit.value = false;
            editName.value = '';
            document.removeEventListener('click', closeEdit);
        }
    };

    const openEdit = () => {
        isEdit.value = true;
        editName.value = file.value.name;
        setTimeout(() => {
            document.addEventListener('click', closeEdit);
        });
    };

    onMounted(() => {
        if (route.query.viewId && Number(route.query.viewId) === file.value.id) {
            isOpenView.value = true;
        }
    });
</script>
<template>
    <div class="library-file-components" @click="onClick">
        <div class="library-file-components__checkbox" v-if="props.isSelectMode">
            <q-checkbox v-model="isSelect" size="xs" @click="onClick" />
        </div>
        <div>
            <q-icon :name="getNameIcon" class="library-file-components__icon" :style="{ color: getColorIcon }" />
        </div>
        <div class="library-file-components__name" v-if="!isEdit">
            <span> {{ file.name }}</span>
        </div>
        <div class="library-file-components__edit" v-else>
            <textarea class="library-file-components__edit__textarea" v-model="editName" />
        </div>
        <q-tooltip v-if="file?.name?.length > 10">{{ file.name }}</q-tooltip>
        <q-menu touch-position context-menu>
            <q-list dense style="min-width: 100px">
                <q-item clickable v-close-popup @click="isOpenView = !isOpenView">
                    <q-item-section>Открыть</q-item-section>
                </q-item>
                <q-item v-if="props.isMultiple" clickable v-close-popup @click="onSelect">
                    <q-item-section>Выбрать</q-item-section>
                </q-item>
                <q-item v-if="!file.isSystem" clickable v-close-popup @click="openEdit">
                    <q-item-section>Переименовать</q-item-section>
                </q-item>
                <q-item v-if="!file.isSystem" clickable v-close-popup @click="isDelete = true">
                    <q-item-section>Удалить</q-item-section>
                </q-item>
            </q-list>
        </q-menu>
    </div>
    <q-dialog v-model="isDelete" @hide="isDelete = false">
        <modal-info title="Вы точно хотите удалить файл?" text="Удаленный файл нельзя будет восстановить" @on-close="isDelete = false" @on-success="onDelete" />
    </q-dialog>
    <content-view v-if="isOpenView" :value="isOpenView" :id="file.id" @update-model="isOpenView = $event" @on-reload="emit('on-update')" />
</template>
<style lang="scss" scoped>
    .library-file-components {
        width: 80px;
        margin: 0 5px;
        padding: 5px;
        border-radius: 5px;
        text-align: center;
        text-overflow: ellipsis;
        transition: 0.4s all;
        cursor: pointer;
        position: relative;

        &:hover {
            background-color: #e7e7e7;
        }

        &__checkbox {
            position: absolute;
            top: -5px;
            right: -5px;
            z-index: 2;
        }

        &__icon {
            color: var(--q-primary);
            font-size: 30px;
        }

        &__name {
            font-size: 12px;
            margin-top: 3px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        &__edit {
            position: relative;
            margin-top: 4px;
            height: 17px;
            &__textarea {
                text-align: center;
                width: 100%;
                resize: none;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                font-size: 12px;
                border: 1px var(--q-primary) solid;
                border-radius: 3px;
                padding: 2px;
            }
        }
    }
</style>

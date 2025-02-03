<script lang="ts" setup>
    import { nextTick, onMounted, ref, Ref, toRefs } from 'vue';
    import PanelLoadFile from './PanelLoadFile.vue';
    import PanelDirectoryCreateOrUpdate from './PanelDirectoryCreateOrUpdate.vue';
    import SelectTypeFile from './SelectTypeFile.vue';
    import SelectDirectory from './SelectDirectory.vue';
    import { CreateLibraryFilesDto } from 'src/ApiClient/ApiClient';
    import { ISearchLibrary } from '../../interface';

    interface IProps {
        directory: CreateLibraryFilesDto | null;
        search: ISearchLibrary;
        isSelectMode: boolean;
    }

    const props = defineProps<IProps>();
    const emit = defineEmits(['on-update', 'on-select-directory', 'on-search', 'on-delete-all']);

    const panelRef = ref<HTMLElement | null>(null);
    const panelHeight = ref(0);
    const select: Ref<CreateLibraryFilesDto | null> = ref(null);
    const isOpenLoadFile: Ref<boolean> = ref(false);
    const isOpenCreateDirectory: Ref<boolean> = ref(false);
    const isViewSearch: Ref<boolean> = ref(false);
    const { search } = toRefs(props);

    const closePanelLoadFile = () => {
        isOpenLoadFile.value = false;
        emit('on-update');
    };

    const closePanelDirectory = () => {
        isOpenCreateDirectory.value = false;
        emit('on-update');
    };

    const onOpenDownloadFile = () => {
        isOpenLoadFile.value = true;
    };

    const onOpenCreateDirectory = () => {
        isOpenCreateDirectory.value = true;
    };

    const onUpdate = () => {
        emit('on-update');
    };

    const onSelectDirectory = (event: CreateLibraryFilesDto | null) => {
        select.value = event;
        emit('on-select-directory', select.value?.id || null);
    };

    const toggleSearch = () => {
        isViewSearch.value = !isViewSearch.value;
        nextTick(() => {
            panelHeight.value = panelRef.value?.offsetHeight || 0;
        });
    };

    onMounted(() => {
        panelHeight.value = panelRef.value?.offsetHeight || 0;
    });

    defineExpose({
        onOpenDownloadFile,
        onOpenCreateDirectory,
        panelHeight,
    });
</script>
<template>
    <div ref="panelRef" class="panel">
        <q-card class="panel-components">
            <q-card-section>
                <div class="panel-components__breadcrumbs q-pb-sm q-mb-md" v-if="props.directory">
                    <q-breadcrumbs>
                        <q-breadcrumbs-el label="Библиотека файлов" />
                        <q-breadcrumbs-el :label="props.directory.name" />
                    </q-breadcrumbs>
                </div>
                <div class="panel-components__body row items-center no-wrpa justify-between">
                    <div class="panel-components__select">
                        <select-directory :value="select" @update-model="onSelectDirectory" />
                    </div>
                    <div class="panel-components__buttons row items-center">
                        <template v-if="isSelectMode">
                            <q-btn color="primary" icon="delete" @click="emit('on-delete-all')" flat>
                                <q-tooltip>Удалить выбранные материалы</q-tooltip>
                            </q-btn>
                            <q-btn color="primary" flat>Отмена</q-btn>
                        </template>
                        <template v-else>
                            <div class="panel-components__buttons__item text-center" @click="isOpenCreateDirectory = true">
                                <q-icon name="folder" class="panel-components__buttons__item__icon"></q-icon>
                                <div class="panel-components__buttons__item__text">Каталог</div>
                                <q-tooltip>Создать каталог</q-tooltip>
                            </div>
                            <div class="panel-components__buttons__item text-center" @click="isOpenLoadFile = true">
                                <q-icon name="note_add" class="panel-components__buttons__item__icon"></q-icon>
                                <div class="panel-components__buttons__item__text">Файл</div>
                                <q-tooltip>Добавить файл</q-tooltip>
                            </div>
                            <div class="panel-components__buttons__item text-center" @click="onUpdate">
                                <q-icon name="cached" class="panel-components__buttons__item__icon"></q-icon>
                                <div class="panel-components__buttons__item__text">Обновить</div>
                                <q-tooltip>Обновить содержимое</q-tooltip>
                            </div>
                            <div class="panel-components__buttons__item text-center" @click="toggleSearch">
                                <q-icon :name="isViewSearch ? 'close' : 'search'" class="panel-components__buttons__item__icon"></q-icon>
                                <div class="panel-components__buttons__item__text">Поиск</div>
                                <q-tooltip>Поиск</q-tooltip>
                            </div>
                        </template>
                    </div>
                </div>
            </q-card-section>
        </q-card>
        <q-card v-if="isViewSearch" class="panel-components__search q-mt-md">
            <q-card-section>
                <q-form class="panel-components__search__form row">
                    <div class="panel-components__search__form__field">
                        <q-input v-model="search.search" label="Название файла" clearable outlined />
                    </div>
                    <div class="panel-components__search__form__field">
                        <select-type-file v-model:modalValue="search.type" @update-model="search.type = $event" />
                    </div>
                    <div class="panel-components__search__form__field full">
                        <q-btn color="primary" @click="emit('on-search')">Применить</q-btn>
                    </div>
                </q-form>
            </q-card-section>
        </q-card>
    </div>
    <q-dialog v-model="isOpenLoadFile">
        <panel-load-file :directory="props.directory" @on-close="closePanelLoadFile" />
    </q-dialog>
    <q-dialog v-model="isOpenCreateDirectory">
        <panel-directory-create-or-update :directory="props.directory" @on-close="closePanelDirectory" />
    </q-dialog>
</template>
<style lang="scss" scoped>
    .panel-components {
        background-color: rgba(255, 255, 255, 0.4);
        box-shadow: none;
        &__breadcrumbs {
            border-bottom: 1px #eaeaea solid;
            font-size: 12px;
        }
        &__select {
            min-width: 300px;
        }
        &__buttons {
            &__item {
                margin: 0 5px;
                color: var(--q-dark);
                transition: 0.4s all;
                cursor: pointer;

                &:hover {
                    color: var(--q-primary);

                    .panel-components__buttons__item__icon {
                        color: var(--q-primary);
                    }
                }

                &__icon {
                    color: var(--q-gray-light);
                    font-size: 20px;
                    transition: 0.4s all;
                }

                &__text {
                    font-size: 11px;
                    margin-top: 3px;
                }
            }
        }

        &__search {
            background-color: rgba(255, 255, 255, 0.4);
            box-shadow: none;
            &__form {
                margin: 0 -10px;
                &__field {
                    width: 25%;
                    margin: 0 10px;

                    &.full {
                        width: 100%;
                        margin-top: 16px;
                    }
                }
            }
        }
    }
</style>

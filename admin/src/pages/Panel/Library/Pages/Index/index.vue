<script lang="ts" setup>
    import Panel from './components/Panel/Panel.vue';
    import Library from './components/Library/Library.vue';
    import { computed, onBeforeMount, Ref, ref } from 'vue';
    import { useRoute } from 'vue-router';
    import { RouterName } from 'src/router/routerName';
    import { CreateLibraryFilesDto, LibraryFilesControllerClient, getApiClientInitialParams } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { ISearchLibrary } from './interface';

    const route = useRoute();
    const { resultError } = useResultException();

    const panelRef = ref<any>(null);
    const libraryRef = ref(null);

    const id: Ref<number | null> = ref(null);
    const directory: Ref<CreateLibraryFilesDto | null> = ref(null);
    const search: Ref<ISearchLibrary> = ref({
        search: null,
        type: null,
    });
    const selectIds = ref<number[]>([]);
    const isSelectMode = ref(false);

    const getPanelHeight = computed(() => {
        return panelRef.value?.panelHeight;
    });

    const onSelect = (id: number) => {
        selectIds.value.push(id);
        isSelectMode.value = true;
    };

    const onDelteAll = async () => {
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).deleteFileIds(selectIds.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            selectIds.value = [];
            isSelectMode.value = false;
            onUpdate();
        }
    };

    const onRemoveSelect = (id: number) => {
        selectIds.value = selectIds.value.filter((el) => el !== id);
        isSelectMode.value = true;
    };

    const onSearch = () => {
        (libraryRef.value! as typeof Library).onSearch();
    };

    const onUpdate = () => {
        (libraryRef.value! as typeof Library).onSearch();
    };

    const onChangeDirectory = async (idDirectory: number | null) => {
        if (idDirectory) {
            id.value = idDirectory;
            const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).getOne(id.value);
            if (!result.isSuccess) {
                resultError(result, null);
            } else {
                directory.value = result.entity;
            }
        } else {
            id.value = null;
            directory.value = null;
            onUpdate();
        }
    };

    const onDownloadFile = () => {
        (panelRef.value! as typeof Panel).onOpenDownloadFile();
    };

    const onCreateDirectory = () => {
        (panelRef.value! as typeof Panel).onOpenCreateDirectory();
    };

    const onSelectDirectory = (event: number | null) => {
        (libraryRef.value! as typeof Library).onSelectDirectory(event);
    };

    onBeforeMount(() => {
        if (route.name === RouterName.LibraryDirectory) {
            id.value = Number(route.params.id);
            onChangeDirectory(id.value);
        }
    });
</script>
<template>
    <div class="library containers">
        <panel
            ref="panelRef"
            :directory="directory"
            :search="search"
            :is-select-mode="isSelectMode"
            @on-update="onUpdate"
            @on-select-directory="onSelectDirectory"
            @on-search="onSearch"
            @on-delete-all="onDelteAll"
        />
        <q-card class="library__body q-mt-lg">
            <q-card-section>
                <library
                    ref="libraryRef"
                    :id="id"
                    :search="search"
                    :select-ids="selectIds"
                    :is-select-mode="isSelectMode"
                    :panel-height="getPanelHeight"
                    @on-directory="onChangeDirectory"
                    @on-select="onSelect"
                    @on-remove-select="onRemoveSelect"
                />
            </q-card-section>
            <q-menu touch-position context-menu>
                <q-list dense style="min-width: 100px">
                    <q-item clickable v-close-popup @click="onDownloadFile">
                        <q-item-section>Загрузить файл</q-item-section>
                    </q-item>
                    <q-item clickable v-close-popup @click="onCreateDirectory">
                        <q-item-section>Создать папку</q-item-section>
                    </q-item>
                </q-list>
            </q-menu>
        </q-card>
    </div>
</template>
<style lang="scss" scoped>
    .library {
        &__body {
            background-color: rgba(255, 255, 255, 0.4);
            box-shadow: none;
        }
    }
</style>

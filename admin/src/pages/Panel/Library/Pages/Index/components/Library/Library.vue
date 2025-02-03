<script lang="ts" setup>
    import { computed, onMounted, ref, Ref, watch } from 'vue';
    import { LibraryFilesControllerClient, getApiClientInitialParams, CreateLibraryFilesDto } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import LibraryFile from './LibraryFile.vue';
    import { useRoute } from 'vue-router';
    import { RouterName } from 'src/router/routerName';
    import { ISearchLibrary } from '../../interface';
    import NoItems from '@/components/NoItems/NoItems.vue';

    interface IProps {
        id?: number | null;
        search: ISearchLibrary;
        isSelectMode: boolean;
        selectIds?: number[];
        panelHeight: number;
    }

    const props = defineProps<IProps>();
    const emit = defineEmits(['on-directory', 'on-select', 'on-remove-select']);

    const { resultError } = useResultException();
    const route = useRoute();

    const isLoading = ref(false);
    const directory: Ref<number | null> = ref(null);
    const files: Ref<CreateLibraryFilesDto[]> = ref([]);
    const paginations = ref({
        limit: 300,
        page: 1,
        count: 0,
    });

    watch(
        () => route.name,
        (newRouteName: any) => {
            if (newRouteName === RouterName.Library) {
                directory.value = null;
                getInfo();
                emit('on-directory', null);
            }
        }
    );

    const getStyle = computed(() => {
        return {
            height: `calc(100vh - 230px - ${props.panelHeight}px)`,
        };
    });

    const getTotalPages = computed(() => {
        return Math.ceil(paginations.value.count / paginations.value.limit);
    });

    const onChengeRouter = (id: number) => {
        directory.value = id;
        files.value = [];
        getInfo();
        emit('on-directory', id);
    };

    const onSelectDirectory = (event: number | null) => {
        directory.value = event;
        getInfo();
    };

    const onScroll = ({ verticalPercentage }: { verticalPercentage: number }) => {
        if (verticalPercentage > 0.9 && paginations.value.page < getTotalPages.value && !isLoading.value) {
            isLoading.value = true;
            paginations.value.page++;
            getInfo();
        }
    };

    const onSearch = () => {
        paginations.value.page = 1;
        files.value = [];
        getInfo();
    };

    const getInfo = async () => {
        isLoading.value = true;
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).get(
            paginations.value.limit,
            paginations.value.page,
            (props.search.type as any) || undefined,
            props.search.search || undefined,
            directory.value ? directory.value : undefined
        );
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            files.value = [...files.value, ...result.entity!.entity!];
            paginations.value.count = result.entity?.count || 0;
        }
        isLoading.value = false;
    };

    onMounted(() => {
        if (props.id) {
            directory.value = props.id;
        }
        getInfo();
    });

    defineExpose({
        getInfo,
        onSearch,
        onSelectDirectory,
    });
</script>
<template>
    <q-scroll-area v-if="files.length" class="library-component__scroll" :style="getStyle" @scroll="onScroll">
        <div class="library-components row items-center">
            <library-file
                v-for="item in files"
                :key="item.id"
                :file="item"
                :is-select-mode="isSelectMode"
                :select-ids="selectIds"
                @on-change-router="onChengeRouter"
                @on-update="getInfo"
                @on-select="emit('on-select', $event)"
                @on-remove-select="emit('on-remove-select', $event)"
            />
        </div>
    </q-scroll-area>

    <no-items :is-hidden-button="true" v-else />
</template>
<style lang="scss" scoped>
    .library-component {
        &__scroll {
            width: 100%;
            min-width: 100%;
        }
    }
</style>

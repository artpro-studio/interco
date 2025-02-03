<script lang="ts" setup>
    import { CreateLibraryFilesDto, LibraryFilesControllerClient, getApiClientInitialParams } from 'src/ApiClient/ApiClient';
    import { computed, PropType, ref, Ref } from 'vue';

    const emit = defineEmits(['update-model']);
    const props: {
        value: CreateLibraryFilesDto | null;
    } = defineProps({
        value: {
            type: Object as PropType<CreateLibraryFilesDto | null>,
        },
    });
    const loading: Ref<boolean> = ref(false);
    let page: number = 1;
    let counter = 0;
    const search: Ref<string> = ref('');
    const limit = 20;
    const options: Ref<CreateLibraryFilesDto[]> = ref([]);

    const currentValue = computed({
        get: () => props.value,
        set: (value: CreateLibraryFilesDto | null) => {
            emit('update-model', value);
        },
    });

    const getCountPage = computed((): number => {
        return Math.ceil(counter / limit);
    });

    const loadCity = async (localPage: number = 1, isPagination: boolean = false) => {
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).getListDirectory(localPage, search.value);
        if (result.isSuccess) {
            counter = result.entity!.count!;
            if (isPagination) {
                options.value = [...options.value, ...result.entity!.entity!];
            } else {
                options.value = result.entity!.entity!;
            }
        }
        loading.value = false;
    };

    async function filterFn(val: string, update: any) {
        loading.value = true;
        search.value = val;
        page = 1;
        if (search.value !== null) {
            // already loaded
            update(() => loadCity(page));
            return;
        }

        update(() => loadCity(page));
    }

    //direction: increase - down , decrease: up
    function onScroll(event: { index: number; from: number; to: number; direction: string; ref: any }) {
        if (event.index > options.value.length - 2 && event.direction === 'increase' && page < getCountPage.value) {
            page++;
            loadCity(page, true);
        }
    }
</script>

<template>
    <q-select
        v-model="currentValue"
        label="Директория"
        option-label="name"
        option-value="id"
        :options="options"
        :input-debounce="500"
        :loading="loading"
        @filter="filterFn"
        @virtual-scroll="onScroll"
        clearable
        use-input
        outlined
    />
</template>

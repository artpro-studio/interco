<script lang="ts" setup>
    import { DropDownDto, getApiClientInitialParams, PagesControllerClient, PagesType } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { computed, PropType, ref, Ref, nextTick, onMounted } from 'vue';

    const { resultError } = useResultException();

    const emit = defineEmits(['input', 'change']);

    const props: {
        value: PagesType | PagesType[] | null;
        multiple: boolean;
    } = defineProps({
        value: {
            type: (Object as PropType<PagesType>) || (Array as PropType<PagesType[]>) || null || undefined,
            required: false,
        },
        multiple: {
            type: Boolean,
            default: false,
        },
    });
    const options: Ref<DropDownDto[]> = ref([]);
    const isLoading: Ref<boolean> = ref(false);

    const filter: Ref<{
        search: string;
        page: number;
        limit: number;
    }> = ref({
        search: '',
        page: 1,
        limit: 10,
    });
    let count = 0;

    const currentValue = computed({
        get: () => props.value,
        set: (value) => emit('input', value),
    });

    const maxPage = computed((): number => {
        return Math.ceil(count / filter.value.limit);
    });

    const getInfo = async () => {
        const result = await new PagesControllerClient(getApiClientInitialParams()).getSelect(
            filter.value.search,
            filter.value.page,
            filter.value.limit
        );
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            count = result.entity.count;
            options.value = result.entity!.entity;
            filter.value.page++;
        }
    };

    const onScroll = async ({ to, ref }) => {
        const lastIndex = options.value.length - 1;

        if (isLoading.value !== true && to === lastIndex && maxPage.value > filter.value.page) {
            isLoading.value = true;

            await getInfo();
            nextTick(() => {
                ref.refresh();
                isLoading.value = false;
            });
        }
    };

    onMounted(() => {
        getInfo();
    });
</script>
<template>
    <q-select
        v-model="currentValue"
        :options="options"
        option-value="value"
        label="Cтраницы"
        :multiple="multiple"
        :clearable="!multiple"
        :use-chips="multiple"
        :loading="isLoading"
        @update:model-value="emit('change')"
        @virtual-scroll="onScroll"
        outlined
    >
    </q-select>
</template>

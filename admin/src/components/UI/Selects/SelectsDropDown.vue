<script lang="ts" setup>
    import { DropDownDto, ResultDropDownDto } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { computed, ref, Ref, nextTick } from 'vue';

    interface IProps {
        api: any;
        label: string;
        value: DropDownDto | DropDownDto[] | null;
        multiple?: boolean;
    }

    const { resultError } = useResultException();

    const emit = defineEmits(['update-model']);

    const props = withDefaults(defineProps<IProps>(), {
        multiple: false,
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
        set: (value) => emit('update-model', value),
    });

    const maxPage = computed((): number => {
        return Math.ceil(count / filter.value.limit);
    });

    const getInfo = async () => {
        const result: ResultDropDownDto = await props.api.getSelect(filter.value.search, filter.value.page, filter.value.limit);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            count = result.entity.count;
            options.value = result.entity!.entity;
        }
        isLoading.value = false;
    };

    const onFilter = (val: string, update: any) => {
        isLoading.value = true;

        update(() => {
            filter.value.search = val;
            getInfo();
        });
    };

    const onScroll = async ({ to, ref }) => {
        const lastIndex = options.value.length - 1;

        if (isLoading.value !== true && to === lastIndex && maxPage.value > filter.value.page) {
            isLoading.value = true;

            filter.value.page++;
            await getInfo();
            nextTick(() => {
                ref.refresh();
                isLoading.value = false;
            });
        }
    };
</script>
<template>
    <q-select
        v-model="currentValue"
        :options="options"
        option-label="label"
        option-value="value"
        :label="props.label"
        :multiple="multiple"
        :clearable="!multiple"
        :use-chips="multiple"
        :loading="isLoading"
        @filter="onFilter"
        @virtual-scroll="onScroll"
        outlined
    >
    </q-select>
</template>

<script lang="ts" setup>
    import {
        CommercialControllerClient,
        CreateProductCommercialOffersDto, getApiClientInitialParams,
    } from 'src/ApiClient/ApiClient';
    import {computed, PropType, ref, Ref} from 'vue';

    const emit = defineEmits(['update-model']);

    const props: {
        value: CreateProductCommercialOffersDto | null,
    } = defineProps({
        value: {
            type: Array as unknown  as PropType<CreateProductCommercialOffersDto>,
        }
    });

    const commercialOption: Ref<CreateProductCommercialOffersDto[]> = ref([]);
    const page: Ref<number> = ref(1);

    const currentModel = computed({
        get: () => props.value,
        set: (value) => emit('update-model', value)
    });

    const filterFn = (val: string, update: any) => {
        update(async () => {
            const result = await new CommercialControllerClient(getApiClientInitialParams()).getPage(page.value);
            if (result.isSuccess) {
                commercialOption.value = result.entity!.entity!;
            }
        });
    };

</script>

<template>
    <q-select
        v-model="currentModel"
        :options="commercialOption"
        option-label="article"
        @filter="filterFn"
        multiple
        use-chips
        filled
    />
</template>

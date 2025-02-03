<script lang="ts" setup>
    import {createApp, PropType, toRefs} from 'vue';
    import Filters from 'components/Filters/Filters.vue';
    import {IProductsFilter} from 'pages/Panel/Catalog/Pages/Products/interface';

    const app = createApp({});
    app.component('Filters', Filters);
    const emit = defineEmits(['on-filters']);

    const props: {
        filters: IProductsFilter
    } = defineProps({
        filters: {
            type: Object as PropType<IProductsFilter>,
            required: true
        }
    });

    const {filters} = toRefs(props);

    const onFilters = () => {
        emit('on-filters');
    };
</script>
<template>
    <filters @on-submit="onFilters">
        <template #default>
            <div class="filters-components__field" style="min-width: 320px">
                <q-input v-model="filters.search" label="Название товара" outlined clearable @update:model-value="onFilters" debounce="500">
                    <template v-slot:prepend>
                        <q-icon name="search" />
                    </template>
                </q-input>
            </div>
        </template>
    </filters>
</template>

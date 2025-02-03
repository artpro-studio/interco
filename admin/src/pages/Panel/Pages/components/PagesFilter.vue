<script lang="ts" setup>
    import Filters from 'components/Filters/Filters.vue';
    import { createApp, PropType, toRefs } from 'vue';
    import { IPagesFilter } from '../interface';
    import SelectPagesType from './Selects/SelectPagesType.vue';
    import { RouterName } from 'src/router/routerName';
    import { useRoute } from 'vue-router';

    const app = createApp({});
    app.component('Filters', Filters);
    const route = useRoute();

    const emit = defineEmits(['on-filters']);
    const props: {
        filters: IPagesFilter;
    } = defineProps({
        filters: {
            type: Object as PropType<IPagesFilter>,
            required: true,
        },
    });
    const { filters } = toRefs(props);

    const onFilters = () => {
        emit('on-filters');
    };
</script>
<template>
    <filters @on-submit="onFilters">
        <template #default>
            <div class="filters-components__field" style="min-width: 320px">
                <q-input
                    v-model="filters.search"
                    label="Название страницы"
                    outlined
                    clearable
                    @update:model-value="onFilters"
                    debounce="500"
                >
                    <template v-slot:prepend>
                        <q-icon name="search" />
                    </template>
                </q-input>
            </div>
            <div class="filters-components__field" v-if="route.name === RouterName.Pages">
                <select-pages-type v-model="filters.pagesType" :multiple="false" @input="filters.pagesType = $event" />
            </div>
        </template>
    </filters>
</template>

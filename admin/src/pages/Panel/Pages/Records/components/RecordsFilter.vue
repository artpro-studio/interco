<script lang="ts" setup>
    import Filters from 'components/Filters/Filters.vue';
    import { createApp, PropType, toRefs } from 'vue';
    import { RouterName } from 'src/router/routerName';
    import { useRoute } from 'vue-router';
    import { IRecordsFilter } from '../interface';
    import SelectsPages from './Selects/SelectsPages.vue';

    const app = createApp({});
    app.component('Filters', Filters);
    const route = useRoute();

    const emit = defineEmits(['on-filters']);
    const props: {
        filters: IRecordsFilter;
    } = defineProps({
        filters: {
            type: Object as PropType<IRecordsFilter>,
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
                    label="Название записи"
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
            <div class="filters-components__field" v-if="route.name === RouterName.Records">
                <selects-pages v-model="filters.pages" :multiple="true" @input="filters.pages = $event" />
            </div>
        </template>
    </filters>
</template>

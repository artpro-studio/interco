<script lang="ts" setup>
    import Filters from 'components/Filters/Filters.vue';
    import SelectsRole from 'components/UI/Selects/SelectsRole/SelectsRole.vue';
    import { createApp, PropType, toRefs } from 'vue';
    import { IUserFilter } from '../interface';

    const app = createApp({});
    app.component('Filters', Filters);

    const emit = defineEmits(['on-filters']);
    const props: {
        filters: IUserFilter;
    } = defineProps({
        filters: {
            type: Object as PropType<IUserFilter>,
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
                <q-input v-model="filters.search" label="ФИО" outlined clearable @update:model-value="onFilters" debounce="500">
                    <template v-slot:prepend>
                        <q-icon name="search" />
                    </template>
                </q-input>
            </div>
            <div class="filters-components__field">
                <selects-role v-model="filters.role" :multiple="true" />
            </div>
        </template>
    </filters>
</template>

<script lang="ts" setup>
    import { computed, toRefs } from 'vue';
    import Pagination from 'src/components/Pagination/Pagination.vue';
    import useDateUntil from 'src/helpers/useDateUntil';
    import { ISendsSubscription, sendsSubscriptionColumnsTable, ISendsSubscriptionFilter } from '../interface';
    import { SendsSubscriptionDescriptionDto, SendsSubscriptionTitleDto } from '@/ApiClient/ApiClient';

    interface IProps {
        rows: ISendsSubscription[];
        count: number;
        limit: number;
        filters: ISendsSubscriptionFilter;
    }
    const { getDateDayMonthYear } = useDateUntil();

    const emit = defineEmits(['update-page', 'on-delete', 'on-open']);
    const props = defineProps<IProps>();

    const { rows } = toRefs(props);
    const columns = sendsSubscriptionColumnsTable;

    const lengthPages = computed(() => {
        return Math.ceil(props.count / props.limit);
    });

    const getTitle = (data: SendsSubscriptionTitleDto[]): string => {
        let title = '';
        data.forEach((el) => {
            title += `${el.lang}: ${el.value}`;
        });

        return title;
    };

    const getDescription = (data: SendsSubscriptionDescriptionDto[]): string => {
        let description = '';
        data.forEach((el) => {
            description += `${el.lang}: ${el.value}`;
        });

        return description.length > 50 ? description.substring(0, 50) + '...' : description;
    };
</script>

<template>
    <q-table :rows="rows" :columns="columns" no-data-label="Ничего не найдено" row-key="name" :rows-per-page-options="[0]">
        <template v-slot:body="props">
            <tr class="cursor-pointer" @click="emit('on-open', props.row.id)">
                <td class="text-left">{{ props.row.id }}</td>
                <td class="text-left">{{ props.row.task?.progress || '0' }}%</td>
                <td class="text-left">
                    {{ getTitle(props.row.title) }}
                </td>
                <td class="text-left">
                    {{ getDescription(props.row.description) }}
                </td>
                <td class="text-left">
                    {{ getDateDayMonthYear(props.row.createdAt) }}
                </td>
                <td class="text-left">
                    {{ getDateDayMonthYear(props.row.updatedAt) }}
                </td>
                <td class="text-left">
                    {{ getDateDayMonthYear(props.row.deletedAt) }}
                </td>
            </tr>
        </template>
        <template v-slot:bottom v-if="lengthPages">
            <pagination :page="filters.page" :count="count" :max="lengthPages" @update="emit('update-page', $event)" />
        </template>
    </q-table>
</template>

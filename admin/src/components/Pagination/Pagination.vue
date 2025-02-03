<script lang="ts" setup>
    import { onMounted, Ref, ref } from 'vue';

    interface IProps {
        page: number,
        max: number,
        count: number,
    }

    const emit = defineEmits(['update']);
    const props = withDefaults(defineProps<IProps>(), {
        page: 1,
        max: 1,
        count: 0
    });

    const localPage: Ref<number> = ref(1);
    const localMax: Ref<number> = ref(1);

    const updatePage = (event: number) => {
        localPage.value = event;
        emit('update', localPage.value);
    };

    onMounted(() => {
        localPage.value = props.page;
        localMax.value = props.max;
    });
</script>

<template>
    <div class="pagination row items-center justify-between">
        <div class="pagination__body">
            <q-pagination
                v-model="localPage"
                color="primary"
                :max="max"
                :max-pages="6"
                @update:model-value="updatePage"
                boundary-numbers
                rounded
            />
        </div>
        <div class="pagination__info">
            <span>Найдено: {{props.count}}</span>
        </div>
    </div>
</template>
<style lang="scss" scoped>
    .pagination {
        width: 100%;
        padding: 20px 0;
    }
</style>

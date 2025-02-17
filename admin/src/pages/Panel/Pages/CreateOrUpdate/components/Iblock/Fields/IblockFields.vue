<script lang="ts" setup>
    import { IIblockField, PagesIBlockFieldsDto } from '@/ApiClient/ApiClient';
    import { onMounted, ref } from 'vue';
    import IblockFieldsItem from './IblockFieldsItem.vue';

    interface IProps {
        fields?: PagesIBlockFieldsDto[] | null;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const fieldsLocal = ref<PagesIBlockFieldsDto[]>([]);

    const onAddField = () => {
        fieldsLocal.value.push({
            name: '',
            slug: '',
            type: IIblockField.Text,
        });
    };

    const onUpdated = (data: PagesIBlockFieldsDto, index: number) => {
        fieldsLocal.value[index] = data;
        emit('on-change', fieldsLocal.value);
    };

    onMounted(() => {
        fieldsLocal.value = props.fields || [];
    });
</script>
<template>
    <div class="i-block__fields">
        <div class="text-h5 q-mb-lg">Поля</div>
        <div class="i-block__fields__body">
            <iblock-fields-item v-for="(item, index) in fieldsLocal" :field="item" :key="index" @on-change="onUpdated($event, index)" />
        </div>
        <q-btn color="primary" @click="onAddField">Добавить</q-btn>
    </div>
</template>

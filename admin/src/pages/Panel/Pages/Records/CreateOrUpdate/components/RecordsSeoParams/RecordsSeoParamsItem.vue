<script lang="ts" setup>
    import { IFieldTypeSeo, ILangPages, RecordsSeoParamsDto } from '@/ApiClient/ApiClient';
    import { onMounted, ref } from 'vue';

    interface IProps {
        data: RecordsSeoParamsDto;
    }

    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const form = ref<RecordsSeoParamsDto>({
        content: '',
        fieldType: IFieldTypeSeo.Title,
        lang: ILangPages.RuRU,
    });

    const optionsLang = [
        {
            value: ILangPages.RuRU,
            label: 'Русский',
        },
        {
            value: ILangPages.EnUS,
            label: 'Английский',
        },
        {
            value: ILangPages.ZhCN,
            label: 'Китайский',
        },
    ];
    const optionsField = [
        {
            value: IFieldTypeSeo.Title,
            label: 'Заголвок',
        },
        {
            value: IFieldTypeSeo.Description,
            label: 'Описание',
        },
        {
            value: IFieldTypeSeo.Keywords,
            label: 'Клюычевые слова',
        },
    ];

    const onChange = () => {
        emit('on-change', form.value);
    };

    onMounted(() => {
        form.value = props.data;
    });
</script>

<template>
    <div class="row q-gutter-md q-mb-md no-wrap">
        <q-select
            v-model="form.fieldType"
            :options="optionsField"
            label="Тип поля"
            style="min-width: 200px;"
            disable
            map-options
            outlined
        />
        <q-select
            v-model="form.lang"
            :options="optionsLang"
            label="Язык"
            style="min-width: 200px;"
            disable
            map-options
            outlined
        />
        <q-input
            class="full"
            v-model="form.content"
            label="Контент"
            outlined
            @update:model-value="onChange($event)"
        />
    </div>
</template>

<script lang="ts" setup>
    import { IFieldTypeSeo, ILangTypeSeo, PagesSeoParamsDto } from '@/ApiClient/ApiClient';
    import { onMounted, ref } from 'vue';

    interface IProps {
        data: PagesSeoParamsDto;
    }

    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const form = ref<PagesSeoParamsDto>({
        content: '',
        fieldType: IFieldTypeSeo.Title,
        lang: ILangTypeSeo.RuRU,
    });

    const optionsLang = [
        {
            value: ILangTypeSeo.RuRU,
            label: 'Русский',
        },
        {
            value: ILangTypeSeo.EnUS,
            label: 'Английский',
        },
        {
            value: ILangTypeSeo.ZhCN,
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

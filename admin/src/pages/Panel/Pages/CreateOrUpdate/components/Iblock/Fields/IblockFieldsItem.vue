<script lang="ts" setup>
    import { IIblockField, ILangPages, PagesIBlockFieldsDto, PagesIblockFieldsLabelDto } from '@/ApiClient/ApiClient';
    import useValidationRules from '@/helpers/useValidationRules';
    import { onBeforeMount, ref } from 'vue';

    interface IProps {
        field?: PagesIBlockFieldsDto;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const { isRequired } = useValidationRules();

    const form = ref<PagesIBlockFieldsDto>({
        name: '',
        slug: '',
        type: IIblockField.Text,
        label: [
            {
                value: '',
                lang: ILangPages.RuRU,
            },
            {
                value: '',
                lang: ILangPages.EnUS,
            },
            {
                value: '',
                lang: ILangPages.ZhCN,
            }
        ]
    });
    const options = [
        {
            value: IIblockField.Text,
            label: 'Текст',
        },
        {
            value: IIblockField.Array,
            label: 'Список',
        },
        {
            value: IIblockField.Image,
            label: 'Изоображение',
        },
        {
            value: IIblockField.Editor,
            label: 'Редактор',
        }
    ];

    const onUpdate = () => {
        emit('on-change', form.value);
    };

    onBeforeMount(() => {
        if (props.field) {
            const fields = props.field;
            fields.label = fields.label?.sort((a: PagesIblockFieldsLabelDto, b: PagesIblockFieldsLabelDto) => a.id! - b.id!);
            form.value = {
                // Сперва то что пришлоа по пропсам чтобы не сломать форму
                ...form.value,
                ...fields,
                label: fields.label?.length ? fields.label : form.value.label
            };
        }

    });
</script>

<template>
    <div class="i-block-fields__item q-mb-md q-pb-md">
        <div class="row nowrap q-gutter-md">
            <q-input
                v-model="form.name"
                label="Название"
                :rules="[isRequired]"
                @update:model-value="onUpdate"
                outlined
            />
            <q-input
                v-model="form.slug"
                label="Символьный код"
                :rules="[isRequired]"
                @update:model-value="onUpdate"
                outlined
            />
            <q-select
                v-model="form.type"
                label="Тип поля"
                :options="options"
                style="min-width: 150px;"
                :rules="[isRequired]"
                @update:model-value="onUpdate"
                emit-value
                map-options
                outlined
            />
        </div>
        <div class="">
            <div class="text-h6 q-mb-md">Название</div>
            <div class="row q-gutter-md">
                <div v-for="(item, index) in form.label" :key="item.lang! + index">
                    <q-input
                        v-model="item.value"
                        :label="item.lang?.toString()"
                        :rules="[isRequired]"
                        style="max-width: 200px;"
                        @update:model-value="onUpdate"
                        outlined
                    />
                </div>
            </div>
        </div>
    </div>
</template>
<style lang="scss" scoped>
    .i-block-fields__item {
        border-bottom: 1px var(--q-gray-light) solid;
    }
</style>

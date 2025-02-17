<script lang="ts" setup>
    import { onBeforeMount, ref } from 'vue';
    import { IAttributeType, optionsAttributeType } from './inteface';
    import { ILangPages } from '@/ApiClient/ApiClient';
    import useValidationRules from '@/helpers/useValidationRules';
    import AttributeText from './AttributeText.vue';
    import AttributesImage from './AttributesImage.vue';

    interface IProps {
        attributes: any;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const { isRequired } = useValidationRules();

    const form = ref<any>([]);
    const options = optionsAttributeType;

    const onUpdate = () => {
        emit('on-change', form.value);
    };

    const onRemove = (index: number) => {
        form.value.splice(index, 1);
    };

    const onAddAttribute = () => {
        form.value.push({
            type: IAttributeType.TEXT,
            name: '',
            fields: {
                [ILangPages.RuRU]: '',
                [ILangPages.EnUS]: '',
                [ILangPages.ZhCN]: '',
            }
        });
    };

    onBeforeMount(() => {
        form.value = props.attributes || [];
    });
</script>

<template>
    <div class="attributes">
        <div class="text-h5 q-mb-md">Дополнительные свойства</div>
        <div class="attributes__body">
            <div v-for="(item, index) in form" :key="index" class="attributes__item">
                <div class="row q-gutter-md items-center">
                    <q-input
                        v-model="item.name"
                        label="Символьный код"
                        :rules="[isRequired]"
                        @update:model-value="onUpdate"
                        outlined
                    />
                    <q-select
                        v-model="item.type"
                        label="Тип поля"
                        :options="options"
                        style="min-width: 150px;"
                        :rules="[isRequired]"
                        @update:model-value="onUpdate"
                        emit-value
                        map-options
                        outlined
                    />
                    <q-btn icon="delete" round size="small" class="attributes__delete" @click="onRemove(index)"/>
                </div>
                <attribute-text
                    v-if="item.type === IAttributeType.TEXT || item.type === IAttributeType.TEXTAREA"
                    :type="item.type"
                    :data="item.fields"
                    @on-change="($event) => {
                        item.field = $event;
                        onUpdate();
                    }"
                />
                <attributes-image
                    v-if="item.type === IAttributeType.IMAGES"
                    :data="item.fields"
                    @on-change="($event) => {
                        item.fields = $event;
                        onUpdate();
                    }"
                />
            </div>
        </div>
        <q-btn icon="add" color="primary" @click="onAddAttribute" round size="small" />
    </div>
</template>
<style lang="scss" scoped>
    .attributes {
        padding-bottom: 15px;

        &__delete {
            margin: 0;
            padding: 0;
            margin-left: 15px;
        }

        &__item {
            border-bottom: 1px var(--q-gray-light) solid;
            padding-bottom: 15px;
            margin-bottom: 16px;
        }
    }
</style>

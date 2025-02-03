<script lang="ts" setup>
    import { PagesType } from 'src/ApiClient/ApiClient';
    import { computed, PropType, ref, Ref } from 'vue';
    import { dataPagesType, IPagesType, ParsePagesType } from '../../interface';

    const emit = defineEmits(['input', 'change']);

    const props: {
        value: PagesType | PagesType[] | null;
        multiple: boolean;
    } = defineProps({
        value: {
            type: (Object as PropType<PagesType>) || (Array as PropType<PagesType[]>) || null || undefined,
            required: false,
        },
        multiple: {
            type: Boolean,
            default: false,
        },
    });
    const options: Ref<IPagesType[]> = ref(dataPagesType);

    const currentValue = computed({
        get: () => props.value,
        set: (value) => emit('input', value),
    });
</script>
<template>
    <q-select
        v-model="currentValue"
        :options="options"
        option-value="value"
        label="Тип страницы"
        :multiple="multiple"
        :clearable="!multiple"
        :use-chips="multiple"
        @update:model-value="emit('change')"
        emit-value
        outlined
    >
        <template v-if="!multiple" v-slot:selected-item="props">
            {{ ParsePagesType[props.opt] }}
        </template>
    </q-select>
</template>

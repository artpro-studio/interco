<script lang="ts" setup>
    import {computed} from 'vue';
    import {
        dataPaymentType,
        IPaymentsDtoType
    } from 'pages/Panel/Payments/Pages/CreateOrUpdate/components/Selects/interface';

    const emit = defineEmits(['update-model']);

    const props: {
        value: string | null,
    } = defineProps({
        value: {
            type: String,
        }
    });
    const options: IPaymentsDtoType[] = dataPaymentType;

    const currentModel = computed({
        get: () => props.value,
        set: (value) =>  emit('update-model', value)
    });
</script>

<template>
    <q-select
        v-model="currentModel"
        :options="options"
        label="Тип оплаты"
        option-label="text"
        option-value="value"
        emit-value
        outlined
    />
</template>

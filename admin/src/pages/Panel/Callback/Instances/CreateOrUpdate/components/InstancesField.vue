<script lang="ts" setup>
    import { onBeforeMount, ref } from 'vue';
    import { ICallbackFieldType } from '@/ApiClient/ApiClient';
    import DatePicker from '@/components/UI/DatePicker/DatePicker.vue';

    interface IProps {
        value: any;
        type: ICallbackFieldType;
        label: string;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['update:value']);
    const localValue = ref<any>('');

    onBeforeMount(() => {
        localValue.value = props.value;
    });
</script>
<template>
    <div class="section-create-form__field q-mb-lg">
        <q-input
            v-if="type === ICallbackFieldType.Number"
            v-model="localValue"
            type="number"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <q-input
            v-if="type === ICallbackFieldType.Text"
            v-model="localValue"
            type="textarea"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <q-input v-if="type === ICallbackFieldType.String" v-model="localValue" :label="label" @update:model-value="emit('update:value', localValue)" outlined />
        <date-picker
            v-if="type === ICallbackFieldType.Date || type === ICallbackFieldType.Datetime"
            v-model:model-value="localValue"
            :type="type === ICallbackFieldType.Datetime ? 'datetime' : undefined"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <q-input v-if="type === ICallbackFieldType.Email" v-model="localValue" :label="label" @update:model-value="emit('update:value', localValue)" outlined />
        <q-input
            v-if="type === ICallbackFieldType.Phone"
            v-model="localValue"
            mask="+ 7 (###) ### - ## ##"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
    </div>
</template>

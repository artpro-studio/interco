<script lang="ts" setup>
    import { CommentStatus } from '@/ApiClient/ApiClient';
    import { computed } from 'vue';
    import { optionsCommentsStatus } from '../interface';

    interface IProps {
        modelValue: CommentStatus | null;
    }
    const props = withDefaults(defineProps<IProps>(), {
        modelValue: CommentStatus.Verify,
    });
    const emit = defineEmits(['update:model-value']);

    const options = optionsCommentsStatus;

    const currentValue = computed({
        get: () => props.modelValue,
        set: (value) => emit('update:model-value', value),
    });
</script>
<template>
    <q-select v-model="currentValue" :options="options" option-label="label" option-value="value" label="Статус" emit-value map-options outlined clearable />
</template>

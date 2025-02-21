<script lang="ts" setup>
    import { computed, onBeforeMount, ref } from 'vue';
    import { ITypePagesParams, PagesParamsFieldValueDto } from '@/ApiClient/ApiClient';
    import Editor from '@/components/Editor/Editor.vue';
    import DatePicker from '@/components/UI/DatePicker/DatePicker.vue';

    interface IProps {
        data: PagesParamsFieldValueDto;
        type: ITypePagesParams;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['update:value']);
    const localValue = ref<PagesParamsFieldValueDto>();


    const updateEditor = (event: any) => {
        localValue.value = event;
        emit('update:value', localValue.value);
    };

    onBeforeMount(() => {
        localValue.value = props.data!;
    });
</script>
<template>
    <div class="section-create-form__field q-mb-lg">
        <q-input v-if="type === ITypePagesParams.Text" v-model="localValue" :label="label" @update:model-value="emit('update:value', localValue)" outlined />
        <q-input
            v-if="type === ITypePagesParams.Number"
            v-model="localValue!.value"
            type="number"
            :label="localValue?.lang?.toString()"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <q-input
            v-if="type === ITypePagesParams.Textarea"
            v-model="localValue"
            type="textarea"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <q-editor
            v-if="type === ITypePagesParams.Editor"
            class="property-editor-components__item__editor"
            v-model="localValue"
            :is-live-save="true"
            @update="updateEditor"
        />
    </div>
</template>

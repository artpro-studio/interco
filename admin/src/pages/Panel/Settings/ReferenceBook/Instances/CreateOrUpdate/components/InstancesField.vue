<script lang="ts" setup>
    import { computed, onBeforeMount, ref } from 'vue';
    import { FullReferenceBookAttributesDtoType } from '@/ApiClient/ApiClient';
    import Editor from '@/components/Editor/Editor.vue';
    import Dropzone from '@/components/NewDropzone/Dropzona.vue';
    import DatePicker from '@/components/UI/DatePicker/DatePicker.vue';

    interface IProps {
        value: any;
        type: FullReferenceBookAttributesDtoType;
        label: string;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['update:value']);
    const localValue = ref<any>('');

    const getFilesImages = computed(() => {
        if (localValue.value && Array.isArray(localValue.value)) {
            return localValue.value;
        }
        return localValue.value ? [localValue.value] : [];
    });

    const updateEditor = (event: any) => {
        localValue.value = event;
        emit('update:value', localValue.value);
    };

    const onAddImage = (event: any) => {
        localValue.value = event;
        emit('update:value', localValue.value);
    };

    const onRemoveImage = (event: any) => {
        if (localValue.value && Array.isArray(localValue.value)) {
            localValue.value = localValue.value.filter((el) => el.id !== event.id);
        } else {
            localValue.value = null;
        }

        emit('update:value', localValue.value);
    };

    onBeforeMount(() => {
        localValue.value = props.value;
    });
</script>
<template>
    <div class="section-create-form__field q-mb-lg">
        <q-input
            v-if="type === FullReferenceBookAttributesDtoType.Text"
            v-model="localValue"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <q-input
            v-if="type === FullReferenceBookAttributesDtoType.Number"
            v-model="localValue"
            type="number"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <date-picker
            v-if="type === FullReferenceBookAttributesDtoType.Date || type === FullReferenceBookAttributesDtoType.Datetime"
            v-model:model-value="localValue"
            :type="type === FullReferenceBookAttributesDtoType.Datetime ? 'datetime' : undefined"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <q-input
            v-if="type === FullReferenceBookAttributesDtoType.Textarea"
            v-model="localValue"
            type="textarea"
            :label="label"
            @update:model-value="emit('update:value', localValue)"
            outlined
        />
        <editor
            v-if="type === FullReferenceBookAttributesDtoType.Editor"
            class="property-editor-components__item__editor"
            v-model="localValue"
            :is-live-save="true"
            @update="updateEditor"
        />
        <div v-if="type === FullReferenceBookAttributesDtoType.Image || type === FullReferenceBookAttributesDtoType.Gallary">
            <Dropzone
                :title="label"
                :files="getFilesImages"
                :is-multiple="type === FullReferenceBookAttributesDtoType.Gallary"
                @on-add-file="onAddImage"
                @on-delete-file="onRemoveImage"
            />
        </div>
    </div>
</template>

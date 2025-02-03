<script lang="ts" setup>
    import { ITemplateComponentsType } from 'src/ApiClient/ApiClient';
    import Editor from 'src/components/Editor/Editor.vue';
    //import Dropzone from 'src/components/Dropzone/Dropzone.vue';
    import Dropzone from '@/components/NewDropzone/Dropzona.vue';
    import { computed } from 'vue';

    const emit = defineEmits(['update', 'change']);

    const props: {
        item: any;
    } = defineProps({
        item: {
            required: true,
        },
    });

    const currentValue = computed({
        // Use computed to wrap the object
        get: () => props.item,
        set: (value) => emit('update', value),
    });

    const getFiles = computed(() => {
        if (Array.isArray(currentValue.value?.value)) {
            return currentValue.value.value;
        }

        return currentValue.value.value ? [currentValue.value.value] : [];
    });

    const changeField = () => {
        emit('change', currentValue.value);
    };

    const updateEditor = (event: any) => {
        emit('update', event);
    };

    const addDropzona = (e: any) => {
        emit('update', e);
    };

    const removeImages = (e: any) => {
        console.log('removeImages', e);
        if (Array.isArray(currentValue.value)) {
            currentValue.value = currentValue.value.filter((el) => el.id !== e.id);
            console.log(currentValue.value);
            emit('update', currentValue.value);
        } else {
            emit('update', null);
        }
    };
</script>
<template>
    <div>
        <q-input
            v-if="currentValue.type === ITemplateComponentsType.TEXT"
            v-model="currentValue.value"
            :label="currentValue.label"
            outlined
            @update:model-value="emit('update', $event)"
        />
        <div v-if="currentValue.type === ITemplateComponentsType.EDITOR">
            <editor :model-value="currentValue.value" @update="updateEditor" />
        </div>
        <q-input
            v-if="currentValue.type === ITemplateComponentsType.TEXTAREA"
            v-model="currentValue.value"
            type="textarea"
            :label="currentValue.label"
            outlined
            @update:model-value="changeField"
        />
        <div v-if="currentValue.type === ITemplateComponentsType.IMAGE || currentValue.type === ITemplateComponentsType.GALLARY">
            <Dropzone
                id="sectionImages"
                :title="currentValue.label"
                :files="getFiles"
                :is-select-file="true"
                :is-multiple="currentValue.type === ITemplateComponentsType.GALLARY"
                @on-add-file="addDropzona"
                @on-delete-file="removeImages"
            />
        </div>
    </div>
</template>

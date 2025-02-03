<script lang="ts" setup>
    import { FileType } from 'src/ApiClient/ApiClient';
    import { computed } from 'vue';
    import { fileTypeArray, IFileTypeArray, FileTypeName } from '../../interface';

    interface IProps {
        modalValue: FileType | null;
    }

    const emit = defineEmits(['update-model']);
    const props = defineProps<IProps>();

    const options: IFileTypeArray[] = fileTypeArray;

    const currentValue = computed({
        get: () => props.modalValue,
        set: (value: FileType | null) => {
            emit('update-model', value);
        },
    });
</script>

<template>
    <q-select v-model="currentValue" label="Тип файла" option-label="name" option-value="value" :options="options" emit-value clearable outlined>
        <template v-slot:selected>
            {{ FileTypeName[currentValue] }}
        </template>
    </q-select>
</template>

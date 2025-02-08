<script lang="ts" setup>
    import Dropzona from '@/components/NewDropzone/Dropzona.vue';
    import { computed, onBeforeMount, ref} from 'vue';

    interface IProps {
        field: Record<string, any>
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);
    const file = ref<any>(null);

    const getUrl = computed(() => {
        return '/api/library-files/upload';
    });

    const onAddFile = (file: any) => {
        const result: any = {...props.field};
        for (let key in result) {
            result[key].value = JSON.stringify(file);
        }
        emit('on-change', result);
    };

    const onRemoveFile = () => {
        console.log('asasd');
        const result: any = {...props.field};
        for (let key in result) {
            result[key].value = '';
        }
        emit('on-change', result);
    };

    onBeforeMount(() => {
        const key = Object.keys(props.field)[0];
        file.value = props.field[key]?.value ? props.field[key].value : null;
    });
</script>
<template>
    <dropzona :is-multiple="false" :upload-url="getUrl" :files="file ? [file] : []" @on-add-file="onAddFile" @on-delete-file="onRemoveFile" />
</template>

<script lang="ts" setup>
    import Dropzona from '@/components/NewDropzone/Dropzona.vue';
    import { computed, onBeforeMount, ref} from 'vue';

    interface IProps {
        data: Record<string, any>
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);
    const file = ref<any>(null);

    const getUrl = computed(() => {
        return '/api/library-files/upload';
    });

    const onAddFile = (file: any) => {
        const result: any = {...props.data};
        for (let key in result) {
            result[key] = file;
        }
        emit('on-change', result);
    };

    const onRemoveFile = () => {
        const result: any = {...props.data};
        for (let key in result) {
            result[key] = '';
        }
        emit('on-change', result);
    };

    onBeforeMount(() => {
        const key = Object.keys(props.data)[0];
        file.value = props.data[key] ? props.data[key] : null;
    });
</script>
<template>
    <dropzona :is-multiple="false" :upload-url="getUrl" :files="file ? [file] : []" @on-add-file="onAddFile" @on-delete-file="onRemoveFile" />
</template>

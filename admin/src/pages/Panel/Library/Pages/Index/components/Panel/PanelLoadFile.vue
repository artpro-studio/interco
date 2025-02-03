<script lang="ts" setup>
    import { CreateLibraryFilesDto } from 'src/ApiClient/ApiClient';
    import Dropzona from '@/components/NewDropzone/Dropzona.vue';
    import { computed } from 'vue';

    interface IProps {
        directory?: CreateLibraryFilesDto | null;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close']);

    const getUrl = computed(() => {
        return props.directory ? `/api/library-files/upload?id=${props.directory.id}` : '/api/library-files/upload';
    });
</script>
<template>
    <q-card class="panel-load-file-components">
        <q-card-section>
            <div class="panel-load-file-components__header q-mb-md row items-center justify-between">
                <div class="text-h4">Добавление файла</div>
                <q-btn icon="close" @click="emit('on-close')" round></q-btn>
            </div>
            <div class="panel-load-file-components__body">
                <dropzona :is-multiple="true" :upload-url="getUrl" :files="[]" />
            </div>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .panel-load-file-components {
        min-width: 500px;
    }
</style>

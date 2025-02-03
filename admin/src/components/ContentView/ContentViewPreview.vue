<script lang="ts" setup>
    import { CreateLibraryFilesDto, FileType } from 'src/ApiClient/ApiClient';
    import { computed, PropType } from 'vue';

    const props: {
        file: CreateLibraryFilesDto;
    } = defineProps({
        file: {
            type: Object as PropType<CreateLibraryFilesDto>,
            required: true,
        },
    });

    // Ссылка на приложения для открытия офисных документов
    const officePreviewUrl = computed<string>(() => {
        return `https://view.officeapps.live.com/op/embed.aspx?src=${encodeURIComponent(props.file.path)}`;
    });
</script>

<template>
    <div class="content-view-preview-components">
        <template v-if="file.type === FileType.Images">
            <img class="content-view-preview-components__images" :src="file.path" />
        </template>
        <template v-if="file.type === FileType.Pdf">
            <iframe class="content-view-preview-components__iframe" :src="file.path" />
        </template>
        <template v-if="file.type === FileType.Docs">
            <iframe class="content-view-preview-components__iframe" title="doc viewer" :src="officePreviewUrl" width="100%" id="iframePreview"></iframe>
        </template>
    </div>
</template>

<style lang="scss" scoped>
    .content-view-preview-components {
        &__images {
            width: 100%;
            height: auto;
        }
        &__iframe {
            border: none;
            width: 100%;
            height: calc(100vh - 105px);
        }
    }
</style>

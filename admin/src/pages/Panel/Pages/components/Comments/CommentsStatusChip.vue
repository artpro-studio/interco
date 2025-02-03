<script lang="ts" setup>
    import { CommentStatus } from '@/ApiClient/ApiClient';

    interface IProps {
        status: CommentStatus;
    }
    const props = defineProps<IProps>();
</script>
<template>
    <q-chip :color="props.status === CommentStatus.Verify ? 'negative' : 'positive'" class="comment-status">
        {{ props.status === CommentStatus.Verify ? 'Не проверен' : 'Проверен' }}
    </q-chip>
</template>
<style lang="scss" scoped>
    .comment-status {
        color: #fff;
    }
</style>

<script lang="ts" setup>
    import { defineEmits } from 'vue';

    const emit = defineEmits(['click']);
    const props: {
        title: string;
        text: string;
        isHiddenButton: boolean;
    } = defineProps({
        title: {
            required: true,
            type: String,
            default: 'Здесь пока ничего нет',
        },
        text: {
            required: true,
            type: String,
            default: 'Добавьте контент',
        },
        isHiddenButton: {
            type: Boolean,
            default: false,
        },
    });

    const onSubmit = () => {
        emit('click');
    };
</script>

<template>
    <div class="no-items">
        <div class="no-items__icon q-mb-md">
            <img src="/images/icons/files-folder.svg" alt="Нет контента" />
        </div>
        <div class="no-items__body">
            <h4 class="text-h5 q-mb-sm">{{ props.title }}</h4>
            <p>{{ props.text }}</p>
            <q-btn v-if="!isHiddenButton" color="primary" class="q-mt-lg" @click="onSubmit">Добавить</q-btn>
        </div>
    </div>
</template>
<style lang="scss" scoped>
    .no-items {
        &__icon {
            text-align: center;
            img {
                height: 60px;
                width: auto;
            }
        }
        &__body {
            text-align: center;
        }
    }
</style>

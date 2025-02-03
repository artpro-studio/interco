<script lang="ts" setup>
    import { watch } from 'vue';

    interface IProps {
        modalValue: boolean;
    }
    const props = defineProps<IProps>();

    watch(
        () => props.modalValue,
        (value) => {
            const body = document.querySelector('body');
            const custmoModals = document.querySelectorAll('.custom-modal');
            if (value) {
                body?.classList.add('q-body--prevent-scroll');
            } else {
                if (custmoModals.length === 1) {
                    body?.classList.remove('q-body--prevent-scroll');
                }
            }
        }
    );
</script>

<template>
    <div v-if="props.modalValue">
        <Teleport to="body">
            <div class="custom-modal">
                <div class="custom-modal__bg"></div>
                <div class="custom-modal__body">
                    <slot name="default"></slot>
                </div>
            </div>
        </Teleport>
    </div>
</template>
<style lang="scss" scoped>
    .custom-modal {
        &__bg {
            background: #181e38;
            opacity: 0.7;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 5999;
        }
        &__body {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 6000;
            padding: 20px;
        }
    }
</style>

<script lang="ts" setup>
    const emit = defineEmits(['close']);

    const close = () => {
        emit('close');
    };
</script>
<template>
    <q-card class="success-modal modal q-pt-lg">
        <q-card-section class="q-pa-lg">
            <div class="success-modal__header modal__header q-mb-lg text-center">
                <h4 class="success-modal__header__title modal__header__title">Спасибо!</h4>
                <p class="success-modal__header__desc modal__header__desc">
                    Ваша заявко успешно принята, мы скоро свяжемся с вами
                </p>
                <q-btn icon="close" round class="modal__header__close" @click="close"></q-btn>
            </div>
        </q-card-section>
    </q-card>
</template>

<script lang="ts" setup>
    const emit = defineEmits(['close']);

    const close = () => {
        emit('close');
    };
</script>
<template>
    <q-card class="text-modal modal q-pt-lg">
        <q-card-section class="q-pa-lg">
            <div class="text-modal__header modal__header q-mb-lg text-left">
                <h4 class="text-modal__header__title modal__header__title">Политика конфедециальности</h4>
                <q-btn icon="close" round class="modal__header__close" @click="close"></q-btn>
            </div>
            <div class="text-modal__body q-mt-lg">
                <p>
                    Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является
                    стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник
                    создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.
                    Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в
                    электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами
                    Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus
                    PageMaker, в шаблонах которых используется Lorem Ipsum.
                </p>
            </div>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .text-modal {
        min-width: 800px;

        &__body {
            p {
                line-height: 1.6;
            }
        }
    }
</style>

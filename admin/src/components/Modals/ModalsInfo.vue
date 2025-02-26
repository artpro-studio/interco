<script lang="ts" setup>
    const emit = defineEmits(['on-success']);
    const props = defineProps({
        title: {
            type: String,
            default: 'Вы точно хотите удалить?',
        },
        text: {
            type: String,
            default: 'Вы точно хотите удалить?',
        },
        img: {
            type: String,
            default: '',
        },
        icon: {
            type: String,
            default: '',
        },
        iconColor: {
            type: String,
            default: '',
        },
    });

    const success = () => {
        emit('on-success');
    };
</script>

<template>
    <q-card class="modal-info">
        <div class="modal-info__top">
            <q-btn class="modal-info__top__btn" round icon="close" v-close-popup />
        </div>

        <q-card-section class="q-pa-lg">
            <div class="modal-info__images q-mb-md" v-if="props.img">
                <img src="/images/emoji/muted.svg" alt="" />
            </div>
            <div class="modal-info__images q-mb-md" v-if="props.icon">
                <q-icon :name="props.icon" :color="props.iconColor" size="48px" />
            </div>
            <div class="modal-info__images q-mb-md" v-else>
                <q-img src="/images/delete.png" height="100px" fit="contain" />
            </div>
            <div class="modal-info__header">
                <h4 class="modal-info__title text-h4 q-mb-sm text-center">{{ props.title }}</h4>
                <p class="modal-info__desc text-center" v-if="props.text">{{ props.text }}</p>
            </div>
        </q-card-section>
        <q-card-actions class="q-pa-lg" align="right">
            <q-btn color="primary" class="modal-info__btn" flat v-close-popup>Отмена</q-btn>
            <q-btn color="primary" class="modal-info__btn" @click="success">Подтвердить</q-btn>
        </q-card-actions>
    </q-card>
</template>
<style lang="scss">
    .modal-info {
        border-radius: 5px !important;
        max-width: 800px !important;

        &__top {
            text-align: right;
            padding: 10px;
            position: relative;
            margin-bottom: 10px;

            &__btn {
                width: 45px !important;
                min-width: 45px !important;
                height: 45px;
                position: absolute;
                top: 10px;
                right: 10px;
                z-index: 2;
            }
        }

        &__images {
            text-align: center;
            img {
                height: 80px;
            }
        }

        &__btn {
            min-width: 140px !important;
            height: 45px;
        }

        &__desc {
            font-size: 14px;
        }
    }
</style>

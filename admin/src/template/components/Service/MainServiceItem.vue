<script lang="ts" setup>
    import { PropType, ref, Ref } from 'vue';

    interface IServiceImages {
        path: string;
    }

    interface IServiceFields {
        title: string;
        desc: string;
        images: IServiceImages;
    }

    const props: {
        data: IServiceFields;
    } = defineProps({
        data: {
            type: Object as PropType<IServiceFields>,
            required: true,
        },
    });

    const isOpenCallback: Ref<boolean> = ref(false);
</script>
<template>
    <div class="service-item-components q-pa-md" :style="{ backgroundImage: 'url(' + props.data.images.path + ')' }">
        <div class="service-item-components__wrapper">
            <div class="service-item-components__header">
                <h4>{{ props.data.title }}</h4>
            </div>
            <div class="service-item-components__content">
                <h5>В стоимость входит:</h5>
                <div v-html="props.data.desc"></div>
                <q-btn color="primary" class="service-item-components__btn" @click="isOpenCallback = !isOpenCallback">
                    Заказать рекламу
                </q-btn>
            </div>
        </div>

        <q-dialog v-model="isOpenCallback">
            <modal-callback @close="isOpenCallback = !isOpenCallback" />
        </q-dialog>
    </div>
</template>
<style lang="scss" scoped>
    .service-item-components {
        width: calc(33.33333% - 16px);
        border-radius: 7px;
        position: relative;
        color: #fff;
        min-height: 255px;
        display: flex;
        align-items: flex-end;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;

        &:hover {
            align-items: flex-start;
            &:before {
                background-color: var(--q-dark-page);
            }
            .service-item-components__content {
                height: auto;
                opacity: 1;
                display: block;
            }
        }

        &:before {
            content: '';
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            background: linear-gradient(180deg, rgba(22, 47, 79, 0) 58.02%, rgba(22, 47, 79, 0.75) 100%);
            border-radius: 7px;
            transition: 0.4s all;
        }

        &__wrapper {
            width: 100%;
        }

        &__header {
            position: relative;
            margin-bottom: 12px;
            h4 {
                font-weight: 700;
                font-size: 1.25em;
                line-height: 1;
            }
        }

        &__content {
            position: relative;
            display: none;
            transition: 0.4s all;
            opacity: 0;

            h5 {
                margin-bottom: 12px;
                font-size: 1em;
                opacity: 0.5;
                font-weight: 700;
            }
        }

        &__btn {
            margin-top: 20px;
            width: 100%;
            height: 51px;

            &:before {
                box-shadow: 0px 0px 30px rgba(32, 184, 129, 0.5);
            }
        }

        @media (max-width: 1024px) {
            width: calc(50% - 16px);
        }
        @media (max-width: 650px) {
            width: 100%;
            min-height: 245px;
            &__header {
                h4 {
                    font-size: 1.1em;
                }
            }
        }
    }
</style>
<style lang="scss">
    .service-item-components__content {
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            column-count: 2;

            li {
                font-size: 1em;
                position: relative;
                padding-left: 10px;
                margin-bottom: 7px;

                &:before {
                    content: '';
                    width: 4px;
                    height: 4px;
                    border-radius: 50%;
                    background-color: var(--q-primary);
                    position: absolute;
                    top: 50%;
                    margin-top: -2px;
                    left: 0;
                }
            }
        }
    }
</style>

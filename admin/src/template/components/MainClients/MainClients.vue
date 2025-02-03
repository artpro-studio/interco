<!-- eslint-disable @typescript-eslint/no-unused-vars -->
<script lang="ts" setup>
    import { Swiper, SwiperSlide } from 'swiper/vue';

    import { PropType } from 'vue';

    const props: {
        data: any;
    } = defineProps({
        data: {
            type: Object as PropType<any>,
        },
    });
</script>
<template>
    <div class="clients-components section-margin-top" id="clients">
        <div class="section-header">
            <h4 class="section-header__title">{{ props.data.title }}</h4>
        </div>
        <div class="clients-components__body">
            <swiper :slides-per-view="3" :space-between="50">
                <swiper-slide
                    v-for="(item, index) in props.data.images"
                    :key="'cliente-' + index"
                    class="clients-components__item"
                >
                    <div class="clients-components__item__images text-center">
                        <img :src="item.path" />
                    </div>
                </swiper-slide>
            </swiper>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    .clients-components {
        &__item {
            img {
                width: 50px !important;
            }
        }

        @media (max-width: 650px) {
            &__item {
                img {
                    height: 30px;
                    width: auto;
                }
            }
        }
    }
</style>

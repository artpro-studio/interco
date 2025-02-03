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
    <div class="jobs-components section-margin-top" id="jobs">
        <div class="section-header">
            <h4 class="section-header__title">{{ props.data.title }}</h4>
            <p class="section-header__desc" v-html="props.data.desc"></p>
        </div>
        <div class="jobs-components__body">
            <swiper :slides-per-view="3" :space-between="50">
                <swiper-slide
                    v-for="(item, index) in props.data.images"
                    :key="'cliente-' + index"
                    class="jobs-components__item"
                >
                    <div
                        class="jobs-components__item__images text-center"
                        :style="{ backgroundImage: 'url(' + item.path + ')' }"
                    ></div>
                </swiper-slide>
            </swiper>

            <div class="jobs-components__arrow row items-center justify-center q-gutter-md q-mt-lg">
                <q-btn color="primary" icon="chevron_left" round />
                <q-btn color="primary" icon="chevron_right" round />
            </div>
        </div>
    </div>
</template>
<style lang="scss">
    .jobs-components {
        background-color: #f4f7fc;
        padding: 60px 0;

        &__body {
            .carousel__viewport {
                padding: 20px 0;
            }
        }

        &__item {
            transition: 0.4s all;

            &.carousel__slide--active {
                transform: scale(1.1);
            }
            &__images {
                width: 289px !important;
                height: 346px;
                border-radius: 7px;
                background-repeat: no-repeat;
                background-position: center;
            }
        }

        @media (max-width: 650px) {
            padding: 20px 0;

            &__body {
                margin-top: 40px;
            }
        }
    }
</style>

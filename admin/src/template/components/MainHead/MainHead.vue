<script lang="ts" setup>
    const props: {
        data: { title: string; description: string; images: any };
    } = defineProps({
        data: {
            type: Object,
            required: false,
        },
    });
</script>

<template>
    <section class="head">
        <div class="container">
            <div class="head__body row no-wrap items-start">
                <div class="head__content" v-if="props.data">
                    <h1 v-if="props.data.title" v-html="props.data.title"></h1>
                    <p v-if="props.data.description" v-html="props.data.description"></p>
                </div>
                <img class="head__images" :src="props.data?.images?.path" alt="" />
            </div>
        </div>
    </section>
</template>
<style lang="scss" scoped>
    .head {
        background-color: #162f4f;
        padding-top: 140px;
        padding-bottom: 230px;
        overflow: hidden;

        &__body {
            position: relative;
        }

        &__content {
            max-width: 585px;
            min-width: 585px;
            h1 {
                font-size: 4em;
                color: #fff;
                font-weight: 500;
                line-height: 1.4;
                margin-bottom: 30px;
            }

            p {
                color: #fff;
                font-size: 1.4em;
                line-height: 1.7;
            }
        }

        &__images {
            position: absolute;
            right: -50px;
            top: 20px;
            width: 704px;
        }

        @media (max-width: 1265px) {
            &__content {
                max-width: 500px;
                min-width: 500px;
            }

            &__images {
                width: 500px;
                right: 0;
            }
        }

        @media (max-width: 1024px) {
            padding-top: 80px;
            padding-bottom: 0;
            &__body {
                flex-wrap: wrap;
            }
            &__content {
                margin: 0 auto;
                text-align: center;
                width: 100%;
                max-width: none;
                margin-bottom: 30px;

                p {
                    max-width: 500px;
                    margin: 0 auto;
                }
            }
            &__images {
                bottom: 0;
                position: relative;
                margin: 0 auto;
            }
        }
        @media (max-width: 768px) {
            &__content {
                min-width: auto;
                h1 {
                    font-size: 3em;
                }

                p {
                    font-size: 1em;
                }
            }
            &__images {
                width: 100%;
                max-width: 500px;
            }
        }
        @media (max-width: 650px) {
            &__content {
                h1 {
                    font-size: 2.5em;
                }
            }
        }
        @media (max-width: 374px) {
            &__content {
                h1 {
                    font-size: 2em;
                }
            }
        }
    }
</style>

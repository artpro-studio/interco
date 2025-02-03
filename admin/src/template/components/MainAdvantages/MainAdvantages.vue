<script lang="ts" setup>
    import { PropType } from 'vue';

    export interface IAdvantagesFields {
        title: string;
        icon: string;
        desc: string;
    }
    export interface IAdvantages {
        title: string;
        fields: IAdvantagesFields[];
    }

    const props: {
        data: IAdvantages;
    } = defineProps({
        data: {
            type: Object as PropType<IAdvantages>,
        },
    });
</script>
<template>
    <div class="advantages-components section-margin-top" id="advantages">
        <div class="container">
            <div class="section-header">
                <h4 class="section-header__title" v-if="props.data">
                    {{ props.data.title }}
                </h4>
            </div>
            <div class="advantages-components__body row q-gutter-md">
                <div
                    class="advantages-components__item"
                    v-for="(item, index) in props.data.fields"
                    :key="'advantages' + index"
                >
                    <q-icon :name="item.icon" color="primary" size="30px" class="q-mb-md" />
                    <h5 class="q-mt-sm q-mb-sm">{{ item.title }}</h5>
                    <div v-html="item.desc"></div>
                </div>
            </div>
        </div>
    </div>
</template>
<style lang="scss" scoped>
    .advantages-components {
        &__item {
            width: calc(25% - 16px);
            margin-bottom: 40px;

            h5 {
                font-size: 1.3em;
                font-weight: 700;
            }
            p {
                font-size: 1em;
                line-height: 1.7;
            }
        }

        @media (max-width: 996px) {
            &__item {
                width: calc(33.3333% - 16px);
            }
        }
        @media (max-width: 768px) {
            &__item {
                width: calc(50% - 16px);
            }
        }
        @media (max-width: 650px) {
            &__item {
                width: 100%;
                margin-bottom: 25px;
            }
        }
    }
</style>

<script lang="ts" setup>
    import { PropType } from 'vue';

    export interface ICompanyChildren {
        title: string;
        desc: string;
    }

    export interface ICompanyContactsChildren {
        href?: string;
        icon: string;
        title?: string;
        text?: string;
    }

    export interface ICompanyContacts {
        social: ICompanyContactsChildren[];
        contacts: ICompanyContactsChildren[];
    }

    export interface ICompany {
        title: string;
        desc: string;
        children: ICompanyChildren[];
        contacts: ICompanyContactsChildren[];
        social: ICompanyContactsChildren[];
    }

    const props: {
        data: ICompany;
    } = defineProps({
        data: {
            type: Object as PropType<ICompany>,
        },
    });
</script>
<template>
    <div class="company-components section-margin-top" id="contacts">
        <div class="container">
            <div class="company-components__body row items-start no-wrap q-gutter-lg">
                <div class="company-components__left">
                    <div class="company-components__info row items-center q-gutter-md q-pa-lg">
                        <div
                            class="company-components__info__item"
                            v-for="(item, index) in props.data.children"
                            :key="'company' + index"
                        >
                            <span class="company-components__info__item__number">{{ item.title }}</span>
                            <p class="company-components__info__item__text">
                                {{ item.desc }}
                            </p>
                        </div>
                    </div>
                </div>
                <div class="company-components__right">
                    <div class="company-components__text">
                        <h4 class="section-header__title">{{ props.data.title }}</h4>
                        <p>{{ props.data.desc }}</p>
                    </div>
                </div>
            </div>
            <div class="company-components__contacts row items-start no-wrap q-gutter-lg q-mt-lg">
                <div class="company-components__left">
                    <h4 class="company-components__contacts__title q-mb-md">Наши контакты</h4>
                    <div class="company-components__contacts__info row items-center">
                        <a
                            class="company-components__contacts__item"
                            v-for="(el, indx) in props.data.contacts"
                            :key="'contacts-' + indx"
                            :href="el.href"
                        >
                            <span class="company-components__contacts__item__icon">
                                <q-icon :name="el.icon" />
                            </span>
                            <span class="company-components__contacts__item__content">
                                <span class="company-components__contacts__item__label">{{ el.title }}</span>
                                <span class="company-components__contacts__item__text">{{ el.text }}</span>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="company-components__right">
                    <h4 class="company-components__contacts__title q-mb-md">Социальные сети:</h4>
                    <div class="company-components__contacts__social row q-gutter-md">
                        <a
                            class="company-components__contacts__social__item"
                            v-for="(el, indx) in props.data.social"
                            :key="'contacts-' + indx"
                            :href="el.href"
                        >
                            <q-icon :name="el.icon" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style lang="scss" scoped>
    .company-components {
        &__body {
            padding: 0 16px;
        }
        &__left {
            width: 45%;
        }
        &__right {
            width: 55%;
        }
        &__info {
            background-color: #f4f7fc;
            border-radius: 7px;
            &__item {
                width: calc(50% - 16px);
                margin-bottom: 20px;

                &__number {
                    color: var(--q-primary);
                    font-weight: 800;
                    font-size: 2.7em;
                    display: block;
                    margin-bottom: 2px;
                }

                &__text {
                    font-size: 1em;
                }
            }
        }
        &__text {
            h4 {
                text-align: left;
            }

            p {
                font-size: 1.1em;
                line-height: 1.8;
            }
        }

        &__contacts {
            &__title {
                font-size: 1.5em;
                opacity: 0.7;
                font-weight: 700;
            }

            &__item {
                width: calc(50% - 20px);
                display: flex;
                align-items: center;
                text-decoration: none;
                color: var(--q-dark);
                margin-bottom: 20px;

                &.full {
                    width: 100%;
                }

                &__icon {
                    background: #20b881;
                    box-shadow: 0px 0px 30px rgba(32, 184, 129, 0.3);
                    border-radius: 5px;
                    margin-right: 16px;
                    width: 43px;
                    min-width: 43px;
                    height: 43px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    i {
                        font-size: 21px;
                        color: #fff;
                    }
                }
                &__label {
                    display: block;
                    opacity: 0.4;
                    font-size: 0.9em;
                }
                &__text {
                    display: block;
                    font-size: 1.1em;
                }
            }
        }

        @media (max-width: 996px) {
            &__left {
                width: 100%;
            }
            &__right {
                width: 100%;
            }
            &__body {
                flex-wrap: wrap;

                .company-components__left {
                    order: 1;
                }

                .company-components__right {
                    order: 0;
                    margin-left: 10px;
                }
            }

            &__info {
                padding: 16px;
                &__item {
                    margin-left: 0;
                }
            }

            &__text {
                margin-bottom: 15px;

                p {
                    font-size: 1em;
                }
            }

            &__contacts {
                flex-wrap: wrap;

                &__item {
                    width: 100%;
                }
            }
        }
    }
</style>

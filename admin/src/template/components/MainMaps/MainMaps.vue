<script lang="ts" setup>
    import { ref, Ref } from 'vue';

    const isLoadingMap: Ref<boolean> = ref(false);
    const form: Ref<any> = ref({
        address: '',
        type: null,
        area: null,
    });
    const optionsArea: Ref<any> = ref([]);
    const optionsType: Ref<any> = ref([]);
    //const mapsData: Ref<any> = ref([]);

    const settings: Ref<any> = ref({
        location: {
            center: [37.617644, 55.755819],
            zoom: 9,
        },
    });
</script>
<template>
    <q-intersection once>
        <section class="maps-components section-margin-top" id="maps">
            <div class="container">
                <div class="section-header">
                    <h4 class="section-header__title">Наши рекламные стенды</h4>
                    <p class="section-header__desc">Выберите адрес для определение стенда</p>
                </div>
                <div class="maps-components__body">
                    <q-form class="maps-components__form">
                        <div class="maps-components__form__body row items-center q-gutter-md">
                            <div class="maps-components__form__field full">
                                <q-input v-model="form.address" label="Адрес" :debounce="1000" clearable outlined />
                            </div>
                            <div class="maps-components__form__field">
                                <q-select
                                    v-model="form.area"
                                    :options="optionsArea"
                                    label="Район"
                                    option-value="id"
                                    option-label="name"
                                    clearable
                                    outlined
                                />
                            </div>
                            <div class="maps-components__form__field">
                                <q-select
                                    v-model="form.type"
                                    :options="optionsType"
                                    label="Размещение рекламы"
                                    option-value="id"
                                    option-label="name"
                                    clearable
                                    outlined
                                />
                            </div>
                            <q-btn typ="submit" class="maps-components__form__btn" color="primary">Найти</q-btn>
                        </div>
                    </q-form>
                    <div class="maps-components__content q-mt-lg">
                        <div
                            class="maps-components__content__loader q-gutter-md row items-center justify-center"
                            v-if="isLoadingMap"
                        >
                            <q-spinner color="primary" size="3em" :thickness="2" />
                        </div>
                        <yandex-map v-else :settings="settings" height="300px" class="maps-components__yandex">
                            <yandex-map-default-scheme-layer :settings="{ theme: 'dark' }" />
                        </yandex-map>
                    </div>
                </div>
            </div>
        </section>
    </q-intersection>
</template>
<style lang="scss" scoped>
    .maps-components {
        &__form {
            &__field {
                width: calc(20% - 16px);
                &.full {
                    width: calc(50% - 16px);
                }
            }
            &__btn {
                width: calc(10% - 16px);
                height: 54px;

                &:before {
                    box-shadow: 0px 0px 30px rgba(32, 184, 129, 0.5);
                }
            }

            @media (max-width: 1024px) {
                &__field {
                    width: calc(22.33333% - 16px);
                    &.full {
                        width: calc(40% - 16px);
                    }
                }
                &__btn {
                    width: calc(15% - 16px);
                }
            }
            @media (max-width: 820px) {
                &__field {
                    width: 100%;
                    &.full {
                        width: 100%;
                    }
                }
                &__btn {
                    width: 100%;
                }
            }
        }

        &__content {
            border-radius: 7px;
            overflow: hidden;

            &__loader {
                height: 550px;

                @media (max-width: 650px) {
                    height: 300px;
                }
            }
        }

        &__yandex {
            height: 550px;

            @media (max-width: 650px) {
                height: 300px;
            }
        }
    }
</style>

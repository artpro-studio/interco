<script lang="ts" setup>
    import { onMounted, onUnmounted, ref, Ref } from 'vue';

    const emit = defineEmits(['on-submit']);
    const isFull: Ref<boolean> = ref(false);
    const isShowFilters: Ref<boolean> = ref(false);

    const submit = () => {
        emit('on-submit');
    };

    const heightFilter = () => {
        const filter: number | undefined = document.getElementById('filterComponentsID')?.offsetHeight;
        if (filter && filter > 80) {
            isFull.value = true;
        } else {
            isFull.value = false;
        }
        isShowFilters.value = !(document.querySelector('body')!.clientWidth < 650);
    };

    onMounted(() => {
        window.addEventListener('resize', heightFilter);
        heightFilter();
    });

    onUnmounted(() => {
        window.removeEventListener('resize', heightFilter);
    });
</script>
<template>
    <div class="filters-components q-mb-lg" :class="{ 'is-full': isFull }">
        <q-form @submit="submit" v-if="isShowFilters">
            <div class="filters-components__wrap row items-center justify-between q-gutter-md q-pa-md">
                <div id="filterComponentsID" class="filters-components__body row items-center q-gutter-md">
                    <slot name="default"></slot>
                </div>
                <div class="main-filters__button">
                    <q-btn type="submit" class="main-filters__button__btn" color="primary">Применить</q-btn>
                </div>
            </div>
        </q-form>
        <q-btn color="primary" class="filters-components__view" :flat="isShowFilters" @click="isShowFilters = !isShowFilters">
            {{ !isShowFilters ? 'Показать фильтры' : 'Скрыть фильтры' }}
        </q-btn>
    </div>
</template>
<style lang="scss" scoped>
    .filters-components {
        background-color: rgba(255, 255, 255, 0.4);
        border-radius: 5px;
        &__wrap {
            padding-top: 0;
        }
        &__body {
            margin: 0;
            width: calc(100% - 140px);
        }

        &__view {
            width: 100%;
            display: none;

            @media (max-width: 650px) {
                display: block;
            }
        }

        &.is-full {
            .filters-components__body {
                width: 100%;
            }
            .main-filters__button {
                width: 100%;
                display: flex;
                justify-content: flex-end;

                @media (max-width: 650px) {
                    &__btn {
                        width: 100%;
                    }
                }
            }
        }
    }
</style>
<style lang="scss">
    .filters-components {
        &__field {
            min-width: 240px;

            @media (max-width: 650px) {
                width: 100%;
                .q-field__label {
                    font-size: 14px;
                }
            }
        }
    }
</style>

<script lang="ts" setup>
    import { Ref, ref } from 'vue';

    const stringOptions = ['Google', 'Facebook', 'Twitter', 'Apple', 'Oracle'];
    const model: Ref<string | null> = ref(null);
    const options: Ref<string[]> = ref(stringOptions);
    const whereSearch: Ref<string | null> = ref(null);
    const optionsWhere: Ref<string[]> = ref(['Каталог', 'Страницы']);

    function filterFn(val: string, update: any) {
        if (val === '') {
            update(() => {
                options.value = stringOptions;
            });
            return;
        }

        update(() => {
            const needle = val.toLowerCase();
            options.value = stringOptions.filter((v: string) => v.toLowerCase().indexOf(needle) > -1);
        });
    }
</script>

<template>
    <div class="header-search-components row items-center no-wrap">
        <q-select
            class="header-search-components__search"
            outlined
            v-model="model"
            use-input
            input-debounce="0"
            label="Поиск"
            :options="options"
            @filter="filterFn"
            style="width: 250px"
            behavior="menu"
        >
            <template v-slot:prepend>
                <q-icon color="primary" name="search" size="20px" />
            </template>
            <template v-slot:no-option>
                <q-item>
                    <q-item-section class="text-grey"> Ничего не найдно </q-item-section>
                </q-item>
            </template>
        </q-select>
        <q-select class="header-search-components__select" v-model="whereSearch" :options="optionsWhere" outlined />
    </div>
</template>
<style lang="scss">
    .header-search-components {
        &__search {
            min-width: 390px;

            .q-field__control {
                border-radius: 5px 0px 0px 5px;
            }
        }
        &__select {
            min-width: 135px;

            .q-field__control {
                border-radius: 0px 5px 5px 0px;
            }
        }

        @media (max-width: 1250px) {
            &__search {
                min-width: 250px;
            }
        }
        &__select {
            min-width: 100px;
        }
    }
</style>

<script lang="ts" setup>
    import {PropType, toRefs} from 'vue';
    import {CreateProductCommercialOffersDto} from 'src/ApiClient/ApiClient';

    const props: {
        form: CreateProductCommercialOffersDto
    } = defineProps({
        form: {
            type: Object as PropType<CreateProductCommercialOffersDto>,
            required: true,
        }
    });

    const {form} = toRefs(props);

</script>
<template>
    <q-card class="section-create-form">
        <q-card-section class="product-create__content">
            <div class="section-create-form__field q-mb-md">
                <q-input
                    color="primary"
                    v-model="form.article"
                    label="Артикул"
                    outlined
                    lazy-rules
                />
            </div>
            <div class="section-create-form__field q-mb-md">
                <q-input
                    color="primary"
                    type="number"
                    v-model="form.basePrice"
                    label="Базовая цена"
                    outlined
                    lazy-rules
                />
            </div>
            <div class="section-create-form__field q-mb-md">
                <q-input
                    color="primary"
                    type="number"
                    v-model="form.purchasePrice"
                    label="Закупочная цена"
                    outlined
                    lazy-rules
                />
            </div>
            <div class="section-create-form__field q-mb-md">
                <q-input
                    color="primary"
                    type="number"
                    v-model="form.salePrice"
                    label="Цена по акции"
                    outlined
                    lazy-rules
                />
            </div>
            <div class="section-create-form__field q-mb-md">
                <q-input
                    color="primary"
                    type="number"
                    v-model="form.weight"
                    label="Вес"
                    outlined
                    lazy-rules
                />
            </div>
            <div class="section-create-form__field q-mb-md">
                <q-input
                    color="primary"
                    type="number"
                    v-model="form.length"
                    label="Длина"
                    outlined
                    lazy-rules
                />
            </div>
            <div class="section-create-form__field q-mb-md">
                <q-input
                    color="primary"
                    type="number"
                    v-model="form.width"
                    label="Ширина"
                    outlined
                    lazy-rules
                />
            </div>
            <div class="section-create-form__field q-mb-md">
                <q-input
                    color="primary"
                    type="number"
                    v-model="form.height"
                    label="Высота"
                    outlined
                    lazy-rules
                />
            </div>
            <div class="section-create-form__field row q-gutter-md">
                <q-toggle
                    color="primary"
                    v-model="form.quantitativeAccounting"
                    label="Включить количественный учет?"
                />
                <q-toggle
                    color="primary"
                    v-model="form.purchaseNotProducts"
                    label="Разрешить покупку при отсутствии товара? "
                />
            </div>
        </q-card-section>

    </q-card>
</template>
<style lang="scss">
.product-create {
    .q-tab {
        text-transform: none;
        color: var(--q-black-gray);
        letter-spacing: normal;
        border-radius: 7px 7px 0 0;

        &__content {
            padding: 10px 0;

            .q-icon {
                color: var(--q-gray-light);
            }
        }

        &.q-tab--active {
            .q-icon {
                color: var(--q-primary) !important;
            }
        }
    }
    .q-tabs {
        &__content {
            border-bottom: 1px #D5D6DE solid;
        }
    }
    &__tabs-panels {
        background-color: transparent;
    }

    .q-tab-panel {
        padding: 0;
        background: transparent;
    }

    &__tab-panel {
        background-color: transparent;
    }
}
</style>

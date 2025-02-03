<script lang="ts" setup>
    import Editor from '@/components/Editor/Editor.vue';
    import {
        FullPropertyLinksDto,
        getApiClientInitialParams,
        PropertyLinkControllerClient,
        PropertyLinksValuesDto,
        Result,
        ResultLinkOptionsDto,
    } from 'src/ApiClient/ApiClient';
    import { onMounted, PropType, ref, Ref } from 'vue';
    import { useQuasar } from 'quasar';
    import { IPropertyLinksValues } from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/interface';

    const $q = useQuasar();

    const emit = defineEmits(['delete']);

    const props: {
        // ID товара
        id: number;
        item: FullPropertyLinksDto;
    } = defineProps({
        id: {
            required: true,
            type: Number,
        },
        item: {
            required: true,
            type: Object as PropType<FullPropertyLinksDto>,
        },
    });

    const value: Ref<IPropertyLinksValues | IPropertyLinksValues[] | null> = ref([]);
    const defaultValue: Ref<IPropertyLinksValues> = ref({
        id: null,
        path: '',
        name: '',
        value: '',
        option: null,
        isLoading: false,
    });

    const deleteProperty = async () => {
        emit('delete', props.item.id);
    };

    const changeField = async (item: IPropertyLinksValues) => {
        item.isLoading = true;

        const result: Result = await new PropertyLinkControllerClient(getApiClientInitialParams()).updateOptions(item);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        }
        item.isLoading = false;
    };

    const addField = async () => {
        const result: ResultLinkOptionsDto = await new PropertyLinkControllerClient(getApiClientInitialParams()).createOptions({
            id: props.item.id!,
            value: defaultValue.value,
        });
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            value.value!.push({
                ...result.entity,
                isLoading: false,
            });
        }
    };

    // Запрос на удалении значения
    const queryDelete = async (id: number) => {
        const result: Result = await new PropertyLinkControllerClient(getApiClientInitialParams()).deleteOptions(id.toString());
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        }
    };

    const deleteField = async (body: PropertyLinksValuesDto, index: number) => {
        value.value!.splice(index, 1);
        await queryDelete(body.id!);
    };

    onMounted(() => {
        if (props.item.value && props.item.value.length === 0) {
            addField();
        } else {
            value.value = props.item.value!.map((el) => {
                return {
                    ...el,
                    isLoading: false,
                };
            });
        }
    });
</script>
<template>
    <q-card class="section-create-form q-mb-lg">
        <q-card-section class="product-create__content q-pb-none">
            <div class="property-editor-components">
                <div class="property-editor-components__header q-mb-lg row items-center justify-between">
                    <h4 class="text-h5">{{ props.item.productProperty.name }}</h4>

                    <q-icon v-if="props.item.id" name="delete" size="20px" class="property-editor-components__icon cursor-pointer" @click="deleteProperty"></q-icon>
                </div>
                <div class="property-editor-components__body">
                    <div class="property-editor-components__item q-mb-md row items-start justify-between no-wrap" v-for="(item, index) in value" :key="'editor' + index">
                        <editor
                            class="property-editor-components__item__editor"
                            v-model="item.value"
                            :is-live-save="true"
                            :is-live-loading="item.isLoading"
                            @update="item.value = $event"
                            @change="changeField(item)"
                        />

                        <q-icon
                            v-if="props.item.id"
                            name="delete"
                            size="20px"
                            class="property-editor-components__icon cursor-pointer q-ml-md"
                            @click="deleteField(item, index)"
                        />
                    </div>
                    <div class="property-editor-components__button" v-if="item.productProperty.multi">
                        <q-btn class="gradient-black" @click="addField"> Добавить </q-btn>
                    </div>
                </div>
            </div>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .property-editor-components {
        &__item {
            &__editor {
                width: 100%;
            }
        }

        &__icon {
            color: var(--q-gray-light);
            transition: 0.4s all;

            &:hover {
                color: var(--q-negative);
            }
        }
    }
    .product-create {
        &__content {
            &.q-pb-none {
                padding-bottom: 0;
            }
        }
    }
</style>

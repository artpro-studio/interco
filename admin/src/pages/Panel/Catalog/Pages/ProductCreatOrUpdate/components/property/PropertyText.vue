<script lang="ts" setup>
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

    const inputFiled: Ref<PropertyLinksValuesDto[]> = ref([]);

    const addFiled = () => {
        if (props.item.productProperty?.multi) {
            inputFiled.value.push({
                id: null,
                path: null,
                name: '',
                value: '',
                option: null,
            });
        }
    };

    // Запрос на удалении значения
    const queryDelete = async (id: number) => {
        const result: Result = await new PropertyLinkControllerClient(getApiClientInitialParams()).deleteOptions(
            id.toString()
        );
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            if (inputFiled.value.length === 0) {
                inputFiled.value.push({
                    id: null,
                    path: '',
                    name: '',
                    value: '',
                    option: null,
                });
            }
        }
    };

    const removeItem = async (body: PropertyLinksValuesDto, index: number) => {
        inputFiled.value!.splice(index, 1);
        await queryDelete(body.id!);
    };

    const deleteProperty = async () => {
        emit('delete', props.item.id);
    };

    const changeInput = async (body: PropertyLinksValuesDto, index: number) => {
        if (!body.id) {
            const result: ResultLinkOptionsDto = await new PropertyLinkControllerClient(
                getApiClientInitialParams()
            ).createOptions({
                id: props.item.id!,
                value: body,
            });
            if (!result.isSuccess) {
                $q.notify({
                    color: 'negative',
                    textColor: 'white',
                    icon: 'warning',
                    message: result.message || 'Произошла ошибка',
                });
            } else {
                inputFiled.value[index] = result.entity;
                addFiled();
            }
        } else {
            const result = await new PropertyLinkControllerClient(getApiClientInitialParams()).updateOptions(body);
            if (!result.isSuccess) {
                $q.notify({
                    color: 'negative',
                    textColor: 'white',
                    icon: 'warning',
                    message: result.message || 'Произошла ошибка',
                });
            } else {
                inputFiled.value[index] = result.entity;
                addFiled();
            }
        }
    };

    onMounted(() => {
        if (props.item.value?.length) {
            inputFiled.value = props.item.value;
        } else if (!props.item.productProperty?.multi) {
            inputFiled.value.push({
                id: null,
                path: null,
                name: '',
                value: '',
                option: null,
            });
        }

        addFiled();
    });
</script>
<template>
    <q-card class="section-create-form q-mb-lg">
        <q-card-section class="product-create__content">
            <div class="property-text-component">
                <div class="property-text-component__header row items-center justify-between">
                    <h4 class="text-h5">{{ props.item.productProperty.name }}</h4>
                    <q-icon
                        v-if="props.item.id"
                        name="delete"
                        size="20px"
                        class="property-text-component__icon cursor-pointer"
                        @click="deleteProperty"
                    ></q-icon>
                </div>
                <div v-if="inputFiled.length" class="q-mt-lg">
                    <div
                        class="property-text-component__item row items-center q-gutter-md no-wrap q-mb-md"
                        v-for="(item, index) in inputFiled"
                        :key="'text' + index"
                    >
                        <q-input
                            color="primary"
                            v-model="item.value"
                            class="property-text-component__item__field"
                            label="Занчение"
                            @blur="changeInput(item, index)"
                            outlined
                        />
                        <q-icon
                            v-if="item.id"
                            name="delete"
                            size="20px"
                            class="property-text-component__icon cursor-pointer"
                            @click="removeItem(item, index)"
                        ></q-icon>
                    </div>
                </div>
            </div>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .property-text-component {
        &__icon {
            color: var(--q-gray-light);
            transition: 0.4s all;

            &:hover {
                color: var(--q-negative);
            }
        }
        &__item {
            &__field {
                width: 100%;
            }
        }
    }
</style>

<script lang="ts" setup>
    import {
        ProdcutPropertyesOptionsDto,
        PropertyLinksValuesDto,
        FullPropertyLinksDto,
        getApiClientInitialParams,
        PropertyLinkControllerClient,
        ResultLinkOptionsDto, Result
    } from 'src/ApiClient/ApiClient';
    import {onMounted, PropType, ref, Ref, toRefs} from 'vue';
    import {useQuasar} from 'quasar';

    const $q = useQuasar();

    const emit = defineEmits(['delete']);
    const props: {
        // ID товара
        id: number,
        item: FullPropertyLinksDto
    } = defineProps({
        id: {
            required: true,
            type: Number,
        },
        item: {
            required: true,
            type: Object as PropType<FullPropertyLinksDto>
        }
    });

    const { item } = toRefs(props);

    const value: Ref<ProdcutPropertyesOptionsDto | ProdcutPropertyesOptionsDto[] | null> = ref(null);

    const deleteProperty = async () => {
        emit('delete', item.value.id);
    };

    // Запрос на удалении значения
    const queryDelete = async (id: number) => {
        const result: Result = await new PropertyLinkControllerClient(getApiClientInitialParams()).deleteOptions(id.toString());
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            item.value.value = item.value.value!.filter((el) => el.id !== id);
        }
    };

    const removeItem = async (index: number, id: number) => {
        value.value!.splice(index, 1);
        const deleteId: number = item.value.value!.find((el) => el.option!.id === id)!.id!;
        await queryDelete(deleteId);
    };

    // Запрос на очику поля
    const queryClearAll = async (ids: string[]) => {
        const result: Result = await new PropertyLinkControllerClient(getApiClientInitialParams()).deleteOptionsAll({
            ids
        });
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        }
    };
    // Очиста поля выбора
    const clearAll = async (event: ProdcutPropertyesOptionsDto[]) => {
        // Если множественное свойство
        if (item.value.productProperty!.multi) {
            const ids: number[] = event.map((el) => el.id!);
            const deleteIds: string[] = item.value.value!.filter((el) => ids.includes(el.option!.id!)).map((el) => el.id!.toString());
            await queryClearAll(deleteIds);
        } else {
            // Если одно значение
            await queryClearAll([item.value.value![0].id!.toString()]);
        }
    };

    const addItem = async (event: { index: number, value: ProdcutPropertyesOptionsDto}) => {
        const result: ResultLinkOptionsDto = await new PropertyLinkControllerClient(getApiClientInitialParams()).createOptions({
            id: props.item.id!,
            value: {
                id: null,
                value: '',
                option: event.value,
                path: null,
                name: '',
            }
        });
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            item.value.value!.push(result.entity);
        }
    };
    // Если у нас не мульти свойства очищаем сохраненый обьект и сохраняем значение
    const changeOne = async () => {
        if (!Array.isArray(value.value)) {
            if (item.value.value && item.value.value.length) {
                await queryDelete(item.value.value[0].id!);
            }
            await addItem({
                index: 0,
                value: value.value!
            });
        }
    };

    onMounted(() => {
        if (props.item.value) {
            if (!props.item.productProperty!.multi) {
                value.value = props.item.value[0]?.option || null;
            } else {
                value.value = props.item.value.map((el: PropertyLinksValuesDto) => el.option!).filter((el) => el) || null;
            }
        }
    });
</script>
<template>
    <q-card class="section-create-form q-mb-lg">
        <q-card-section class="product-create__content">
            <div class="property-list row items-center q-gutter-md no-wrap">
                <q-select
                    v-model="value"
                    :label="props.item.productProperty.name"
                    :options="props.item.productProperty.options"
                    :multiple="props.item.productProperty.multi"
                    option-label="value"
                    option-value="id"
                    color="primary"
                    class="property-list__select"
                    outlined
                    clearable
                    @clear="clearAll"
                    @add="addItem"
                    @update:model-value="changeOne"
                >
                    <template v-slot:selected-item="scope">
                        <div class="property-list__item q-mr-xs q-mb-xs">
                            {{ scope.opt.value }}
                            <q-icon
                                v-if="item.productProperty.multi"
                                name="close"
                                class="cursor-pointer"
                                size="18px"
                                @click="removeItem(scope.index, scope.opt.id)"
                            />
                        </div>
                    </template>
                </q-select>
                <q-icon
                    v-if="props.item.id"
                    name="delete"
                    size="20px"
                    class="property-list__icon cursor-pointer"
                    @click="deleteProperty"
                ></q-icon>
            </div>
        </q-card-section>
    </q-card>

</template>
<style lang="scss" scoped>
    .property-list {
        &__select {
            width: 100%;
        }
        &__item {
            background-color: var(--q-primary);
            color: #fff;
            padding: 5px;
            line-height: 1;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }

        &__icon {
            color: var(--q-gray-light);
            transition: .4s all;

            &:hover {
                color: var(--q-negative);
            }
        }
    }
</style>
<style lang="scss">
    .property-list {
        .q-field__native {
            margin-top: 10px;
        }
    }
</style>

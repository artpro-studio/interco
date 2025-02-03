<script lang="ts" setup>
    import { computed, onMounted, PropType, ref, Ref } from 'vue';
    import {
        CreateProductPropertyesDto,
        getApiClientInitialParams,
        PropertyControllerClient,
        PropertyLinkControllerClient,
        PropertyLinksDto,
        ResponsePropertyesListDto,
    } from 'src/ApiClient/ApiClient';
    import { useQuasar } from 'quasar';
    import NoItems from 'src/components/NoItems/NoItems.vue';
    import { useRouter } from 'vue-router';
    import { RouterName } from 'src/router/routerName';

    interface ICreateProductPropertyesDto extends CreateProductPropertyesDto {
        isSelect: boolean;
    }

    const router = useRouter();
    const $q = useQuasar();

    const emit = defineEmits(['change']);
    const props: {
        // ID товара
        id: number | null;
        idCommercial: number | null;
        ids: number[];
    } = defineProps({
        id: {
            required: false,
            type: Number,
        },
        idCommercial: {
            type: Number,
            default: null,
        },
        ids: {
            required: false,
            type: Array as PropType<number[] | null>,
            default: null,
        },
    });

    const propertyes: Ref<ICreateProductPropertyesDto[]> = ref([]);
    const columns = [
        {
            name: 'isSelect',
            label: '',
            align: 'left',
            style: 'width: 50px',
        },
        {
            name: 'id',
            label: 'ID',
            align: 'left',
        },
        {
            name: 'name',
            label: 'Название',
            align: 'left',
        },
        {
            name: 'type',
            label: 'Тип',
            align: 'left',
        },
        {
            name: 'isFilter',
            label: 'Показывать в фильтре',
            align: 'left',
        },
        {
            name: 'multi',
            label: 'Множественное свойство',
            align: 'left',
        },
    ];
    const isLoading: Ref<boolean> = ref(true);

    const counterSelect = computed((): string => {
        const select: ICreateProductPropertyesDto[] | undefined = propertyes.value.filter(
            (el: ICreateProductPropertyesDto) => el.isSelect
        );
        return select ? select.length.toString() : '';
    });

    const createProperty = () => {
        router.push({
            name: RouterName.CatalogPropertyCreate,
        });
    };

    const propertyProduct = async () => {
        const property: PropertyLinksDto[] = propertyes.value
            .filter((el: ICreateProductPropertyesDto) => el.isSelect)
            .map((el) => {
                // eslint-disable-next-line @typescript-eslint/no-unused-vars
                const { isSelect, ...property } = el;
                return {
                    id: null,
                    productProperty: property,
                };
            });
        const result = await new PropertyLinkControllerClient(getApiClientInitialParams()).create({
            id: props.id || null,
            idCommercial: props.idCommercial || null,
            property,
        });
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            emit('change');
        }
    };

    const propertyCommercial = async () => {
        const property: PropertyLinksDto[] = propertyes.value
            .filter((el: ICreateProductPropertyesDto) => el.isSelect)
            .map((el) => {
                // eslint-disable-next-line @typescript-eslint/no-unused-vars
                const { isSelect, ...property } = el;
                return {
                    id: null,
                    productProperty: property,
                };
            });
        const result = await new PropertyLinkControllerClient(getApiClientInitialParams()).createCommercial({
            id: props.id || null,
            idCommercial: props.idCommercial || null,
            property,
        });
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            emit('change');
        }
    };

    const onChange = async () => {
        if (props.id) {
            propertyProduct();
        } else if (props.idCommercial) {
            propertyCommercial();
        }
    };

    const getInfo = async () => {
        const ids = props.ids && props.ids.length ? JSON.stringify(props.ids) : null;
        const status = !!props.idCommercial;
        const result: ResponsePropertyesListDto = await new PropertyControllerClient(getApiClientInitialParams()).get(
            1,
            status,
            ids
        );
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            propertyes.value = result.entity!.entity!.map((el: CreateProductPropertyesDto) => {
                return {
                    ...el,
                    isSelect: false,
                };
            });
        }
        isLoading.value = false;
    };

    onMounted(() => {
        getInfo();
    });
</script>
<template>
    <q-card class="main-modal" style="min-width: 1400px">
        <div class="main-modal__top">
            <q-btn class="main-modal__top__btn" round icon="close" v-close-popup />
        </div>
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <q-card-section v-else-if="propertyes && propertyes.length">
            <div class="main-modal__header q-mb-lg">
                <h4 class="text-h3 q-mb-sm">Cвойства</h4>
                <p class="main-modal__header__desc">Выберите свойства которые хотите прикрепить к товару</p>
            </div>
            <q-table
                :rows="propertyes"
                :columns="columns"
                no-data-label="Ничего не найдено"
                :rows-per-page-options="[0]"
                row-key="name"
                virtual-scroll
                hide-bottom
            >
                <template v-slot:body="props">
                    <tr>
                        <td class="text-left" style="width: 50px">
                            <q-checkbox v-model="props.row.isSelect" />
                        </td>
                        <td class="text-left">{{ props.row.id }}</td>
                        <td class="text-left">{{ props.row.name }}</td>
                        <td class="text-left">{{ props.row.type }}</td>
                        <td class="text-left">
                            <q-checkbox v-model="props.row.isFilter" disable />
                        </td>
                        <td class="text-left">
                            <q-checkbox v-model="props.row.multi" disable />
                        </td>
                    </tr>
                </template>
            </q-table>
            <div class="main-modal__buttons q-mt-md row justify-end">
                <q-btn color="primary" flat v-close-popup>Отмена</q-btn>
                <q-btn color="primary" class="q-ml-md" @click="onChange">Добавить ({{ counterSelect }})</q-btn>
            </div>
        </q-card-section>
        <q-card-section v-else>
            <no-items title="Свойства не найдены" text="Добавьте свойства в настройкаих" @click="createProperty" />
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .main-modal {
        @media (max-width: 1400px) {
            width: 100%;
            min-width: 100% !important;
        }
    }
</style>

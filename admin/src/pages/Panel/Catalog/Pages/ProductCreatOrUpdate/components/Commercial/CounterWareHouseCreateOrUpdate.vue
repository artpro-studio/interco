<script lang="ts" setup>
    import {onMounted, ref, Ref} from 'vue';
    import {
        CounterWareHouseControllerClient,
        CreateCounterCommercialWareHouseDto,
        CreateWarehouseDto,
        getApiClientInitialParams,
        ResponseCounterWareHouseDto,
        ResponseWarehouseListModalDto,
        WareHouseControllerClient
    } from 'src/ApiClient/ApiClient';
    import {useQuasar} from 'quasar';

    const $q = useQuasar();

    const emit = defineEmits(['change']);

    const props: {
        id: number,
        idCommercial: number,
        ids: number[] | null,
    } = defineProps({
        id: {
            required: false,
            type: Number,
        },
        idCommercial: {
            required: true,
            type: Number,
        },
        ids: {
            required: true,
            type: Array,
        },
    });

    const form: Ref<CreateCounterCommercialWareHouseDto> = ref({
        id: null,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        quantity: 0,
    });
    const wareHouseOptions: Ref<CreateWarehouseDto[]> = ref([]);
    const wareHouse: Ref<CreateWarehouseDto | null> = ref(null);

    const allWareHouse = async () => {
        const ids = props.ids ? JSON.stringify(props.ids) : null;
        const result: ResponseWarehouseListModalDto = await new WareHouseControllerClient(getApiClientInitialParams()).getAll(ids);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            wareHouseOptions.value = result.entity!;
        }
    };

    const updateData = async () => {
        const result =  await new CounterWareHouseControllerClient(getApiClientInitialParams()).update({
            idCommercial: props.idCommercial,
            idWareHouse: wareHouse.value!.id!,
            form: form.value,
        });

        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            emit('change');
        }
    };

    const createData = async () => {
        console.log(wareHouse.value?.id);
        const result = await new CounterWareHouseControllerClient(getApiClientInitialParams()).create({
            idCommercial: props.idCommercial,
            idWareHouse: wareHouse.value!.id!,
            form: form.value,
        });

        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            emit('change');
        }
    };

    const onChange = () => {
        if (props.id) {
            updateData();
        } else {
            createData();
        }
    };

    const getInfo = async () => {
        const result: ResponseCounterWareHouseDto = await new CounterWareHouseControllerClient(getApiClientInitialParams()).getOne(props.id.toString());
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            form.value = result.entity!;
            wareHouse.value = result.entity?.wareHouse || null;
        }
    };

    onMounted(() => {
        if (props.id) {
            getInfo();
        }

        allWareHouse();
    });

</script>

<template>
    <q-card class="counter-ware-house-components">
        <q-card-section>
            <h4 class="text-h4 q-mb-lg">Создание колличественого учета</h4>
            <q-form>
                <div class="section-create-form__field q-mb-md">
                    <q-input
                        color="secondary"
                        v-model="form.quantity"
                        label="Артикул"
                        outlined
                        lazy-rules
                    />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-select
                        v-model="wareHouse"
                        :options="wareHouseOptions"
                        option-label="name"
                        option-value="id"
                        color="secondary"
                        label="Склад"
                        outlined
                        clearable
                    />
                </div>
                <div class="counter-ware-house-components__buttons">
                    <q-btn class="gradient-black" @click="onChange">
                        <span>Сохранить</span>
                    </q-btn>
                </div>
            </q-form>
        </q-card-section>
    </q-card>

</template>
<style lang="scss">
    .counter-ware-house-components {
        &__buttons {
            button {
                width: 100%;
            }
        }
    }
</style>

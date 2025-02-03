<script lang="ts" setup>
    import NoItems from 'components/NoItems/NoItems.vue';
    import PropertyModalList from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/PropertyModalList.vue';
    import PropertyBody from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/PropertyBody.vue';
    import { computed, onMounted, ref, Ref } from 'vue';
    import {
        FullPropertyLinksDto,
        getApiClientInitialParams,
        PropertyLinkControllerClient,
        ResponsePropertyLinkListDto,
    } from 'src/ApiClient/ApiClient';
    import { useQuasar } from 'quasar';

    const $q = useQuasar();

    const props: {
        // ID товара
        id: number | null;
        idCommercial: number | null;
    } = defineProps({
        id: {
            required: false,
            type: Number,
        },
        idCommercial: {
            required: true,
            type: Number,
            default: null,
        },
    });
    const isLoading: Ref<boolean> = ref(true);
    // Все доступные свойства
    const propertyes: Ref<FullPropertyLinksDto[] | null> = ref(null);
    // Модальное окно для добавления свойств
    const isOpenModalProperty: Ref<boolean> = ref(false);

    const ids = computed((): number[] | null => {
        return propertyes.value ? propertyes.value!.map((el) => el.productProperty!.id!) : null;
    });

    const getInfo = async () => {
        const result: ResponsePropertyLinkListDto = await new PropertyLinkControllerClient(
            getApiClientInitialParams()
        ).get(props.id);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        }
        propertyes.value = result.entity;
        isLoading.value = false;
    };

    const getInfoCommercial = async () => {
        const result: ResponsePropertyLinkListDto = await new PropertyLinkControllerClient(
            getApiClientInitialParams()
        ).getCommercial(props.idCommercial);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        }
        propertyes.value = result.entity;
        isLoading.value = false;
    };

    const changeModal = () => {
        isLoading.value = true;
        isOpenModalProperty.value = false;
        if (props.id) {
            getInfo();
        } else if (props.idCommercial) {
            getInfoCommercial();
        }
    };

    onMounted(() => {
        if (props.id) {
            getInfo();
        } else if (props.idCommercial) {
            getInfoCommercial();
        }
    });
</script>
<template>
    <div>
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <template v-else>
            <div v-if="propertyes && propertyes.length">
                <property-body :propertyes="propertyes" :id="id" @delete="changeModal" />
                <q-btn color="primary" class="circle fixed is-form" @click="isOpenModalProperty = true">
                    <q-icon name="add"></q-icon>
                    <q-tooltip anchor="center left" self="center right">Добавить свойство</q-tooltip>
                </q-btn>
            </div>
            <q-card v-else class="section-create-form">
                <q-card-section>
                    <no-items text="Добавьте свойства" @click="isOpenModalProperty = !isOpenModalProperty" />
                </q-card-section>
            </q-card>

            <q-dialog v-model="isOpenModalProperty">
                <property-modal-list :id="id" :ids="ids" :id-commercial="props.idCommercial" @change="changeModal" />
            </q-dialog>
        </template>
    </div>
</template>

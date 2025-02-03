<script lang="ts" setup>
    import { AmoCustmoFieldsDto, AmoCustomFieldsControllerClient, getApiClientInitialParams } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { computed, onMounted, ref } from 'vue';
    import CreateUpdateAmoCustomFields from './CreateUpdateAmoCustomFields.vue';
    import ModalsInfo from '@/components/Modals/ModalsInfo.vue';
    import { CallbackFieldData } from '@/pages/Panel/Callback/CreateOrUpdate/components/FieldIndex/interface';
    import { useQuasar } from 'quasar';

    const { resultError } = useResultException();
    const $q = useQuasar();

    const api = new AmoCustomFieldsControllerClient(getApiClientInitialParams());

    const isLoading = ref(true);
    const filters = ref({
        page: 1,
        limit: 100,
        search: '',
    });
    const rows = ref<AmoCustmoFieldsDto[]>([]);
    const modalCreateOrUpdate = ref<{
        isOpen: boolean;
        id: null | number;
    }>({
        isOpen: false,
        id: null,
    });

    const modalDelete = ref<{
        isOpen: boolean;
        id: null | number;
    }>({
        isOpen: false,
        id: null,
    });

    const selectListAttribute = computed(() => {
        return rows.value.map((el) => el.attribute);
    });

    const onCloseModal = () => {
        modalCreateOrUpdate.value = {
            id: null,
            isOpen: false,
        };
        getInfo();
    };

    const onOpenModal = (id: number | null = null) => {
        modalCreateOrUpdate.value = {
            id: id || null,
            isOpen: true,
        };
    };

    const onCloseModalDelete = () => {
        modalDelete.value = {
            isOpen: false,
            id: null,
        };
    };

    const onOpeneModalDelete = (id: number) => {
        modalDelete.value = {
            isOpen: true,
            id,
        };
    };

    const onDeleteField = async () => {
        const result = await api.delete(modalDelete.value.id!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            getInfo();
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Поле удалено',
            });
        }
    };

    const getInfo = async () => {
        const result = await api.get(filters.value.search, filters.value.page, filters.value.limit);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value = result.entity?.entity || [];
        }
        isLoading.value = false;
    };

    onMounted(() => {
        getInfo();
    });
</script>
<template>
    <div class="q-pa-md flex flex-center" v-if="isLoading">
        <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
    </div>
    <div class="amo-crm-cutoms-fileds row items-center q-gutter-md" v-else>
        <div v-for="item in rows" :key="item.id!" class="amo-crm-cutoms-fileds__item">
            {{ item.amoID }} - {{ CallbackFieldData[item.attribute] }}
            <q-btn icon="edit" class="q-ml-sm" size="10px" @click="() => onOpenModal(item.id!)" round></q-btn>
            <q-btn icon="close" size="10px" @click="() => onOpeneModalDelete(item.id!)" round></q-btn>
        </div>
        <q-btn color="primary" outline>
            <q-icon name="add" @click="() => onOpenModal()" />
        </q-btn>
    </div>
    <q-dialog v-model="modalCreateOrUpdate.isOpen" @hide="onCloseModal">
        <create-update-amo-custom-fields :id="modalCreateOrUpdate.id" :select-list-attribute="selectListAttribute" @on-close="onCloseModal" />
    </q-dialog>
    <q-dialog v-model="modalDelete.isOpen" @hide="onCloseModalDelete">
        <modals-info title="Вы точно хотите удалить поле?" text="Удаленное поле нельзя будет восстановить" @on-success="onDeleteField" />
    </q-dialog>
</template>
<style lang="scss" scoped>
    .amo-crm-cutoms-fileds {
        &__item {
            height: 45px;
            border: 1px var(--q-primary) solid;
            color: var(--q-primary);
            border-radius: 4px;
            display: flex;
            align-items: center;
            padding: 5px 10px;
        }
    }
</style>

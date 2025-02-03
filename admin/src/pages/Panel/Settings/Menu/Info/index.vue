<script lang="ts" setup>
    import {
        getApiClientInitialParams,
        SettingsMenuItemControllerClient,
        SettingsMenuItemDto,
    } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { onMounted, Ref, ref } from 'vue';
    import { useRoute } from 'vue-router';
    import CreateOrUpdateMenu from './components/CreateOrUpdateMenu.vue';
    import MenuItem from './components/MenuItem.vue';
    import ModalsInfo from '@/components/Modals/ModalsInfo.vue';

    const route = useRoute();
    const { resultError } = useResultException();

    const api = new SettingsMenuItemControllerClient(getApiClientInitialParams());
    const isLoading = ref(true);
    const id: Ref<number | null> = ref(null);
    const rows: Ref<SettingsMenuItemDto[]> = ref([]);

    const modalCreatePoints: Ref<{
        isOpen: boolean;
        id: number | null;
        parentId: number | null;
    }> = ref({
        isOpen: false,
        id: null,
        parentId: null,
    });

    const modalDelete: Ref<{
        id: number | null;
        isOpen: boolean;
    }> = ref({
        id: null,
        isOpen: false,
    });

    const findItemForRows = (
        id: number,
        data: SettingsMenuItemDto[],
        parentId?: number
    ): { id: number | null; parentId: number | null } => {
        let result: { id: number | null; parentId: number | null } = {
            id: null,
            parentId: parentId || null,
        };
        data.forEach((item: SettingsMenuItemDto) => {
            if (item.id === id) {
                result.id = item.id;
            } else if (item.children.length) {
                result = findItemForRows(id, item.children, item.id!);
            }
        });
        return result;
    };

    const onOpenPoints = (parent?: number) => {
        modalCreatePoints.value = {
            isOpen: true,
            id: null,
            parentId: parent || null,
        };
    };

    const onOpenEdit = (id: number) => {
        const result = findItemForRows(id, rows.value);
        modalCreatePoints.value = {
            isOpen: true,
            id: result.id!,
            parentId: result.parentId,
        };
    };

    const onCloseModalCreate = () => {
        modalCreatePoints.value = {
            isOpen: false,
            id: null,
            parentId: null,
        };
    };

    const onSuccessCreate = () => {
        onCloseModalCreate();
        getInfo();
    };

    const onOpenDelete = (id: number) => {
        modalDelete.value = {
            isOpen: true,
            id,
        };
    };

    const onCloseDelete = () => {
        modalDelete.value = {
            isOpen: false,
            id: null,
        };
    };

    const setSortOrder = (data: SettingsMenuItemDto[]) => {
        return data.map((item: SettingsMenuItemDto, index: number) => {
            item.order = index;
            if (item.children.length) {
                item.children = setSortOrder(item.children);
            }

            return item;
        });
    };

    const onEnd = async () => {
        rows.value = setSortOrder(rows.value);
        const result = await api.onUpdateOrder({ data: rows.value });
        if (!result.isSuccess) {
            resultError(result, null);
        }
    };

    const onDelete = async () => {
        const result = await api.delete(modalDelete.value.id!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            onCloseDelete();
            getInfo();
        }
    };

    const getInfo = async () => {
        isLoading.value = true;
        const result = await api.get(id.value!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value = result.entity?.sort((a, b) => a.order - b.order) || [];
        }
        isLoading.value = false;
    };

    onMounted(() => {
        id.value = Number(route.params.id);
        getInfo();
    });
</script>

<template>
    <div class="container__wrap">
        <h4 class="text-h5 q-mb-lg">Пункты меню</h4>
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <q-card class="menu-form-components section-create-form" v-else>
            <q-card-section>
                <menu-item
                    :rows="rows"
                    @on-create-points="onOpenPoints"
                    @on-open-edit="onOpenEdit"
                    @on-open-delete="onOpenDelete"
                    @on-end="onEnd"
                />
            </q-card-section>
        </q-card>
    </div>
    <q-btn color="primary" class="circle fixed" @click="onOpenPoints()">
        <q-icon name="add"></q-icon>
    </q-btn>
    <q-dialog v-model="modalCreatePoints.isOpen" @hide="onCloseModalCreate">
        <create-or-update-menu
            v-if="id"
            :id="modalCreatePoints.id"
            :id-menu="id"
            :parent-id="modalCreatePoints.parentId"
            @on-close="onCloseModalCreate"
            @on-success="onSuccessCreate"
        />
    </q-dialog>
    <q-dialog v-model="modalDelete.isOpen" @hide="onCloseDelete">
        <modals-info
            title="Вы точно хотите удалить пункт?"
            text="Удаленный пункт нельяз будет вернуть"
            @on-success="onDelete"
        />
    </q-dialog>
</template>

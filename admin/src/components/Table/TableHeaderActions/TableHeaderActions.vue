<script lang="ts" setup>
    import { onBeforeMount, ref, Ref } from 'vue';
    import { ITableAction } from '../interface';

    interface IProps {
        data?: ITableAction[];
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-checked', 'on-delete']);

    const isAllChecked: Ref<boolean> = ref(false);
    const localMenu = ref<ITableAction[]>([
        {
            name: 'Удалить',
            icon: 'delete',
            action: () => onDelete(),
            isView: true,
        },
    ]);

    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    function onAllChecked(status: boolean) {
        isAllChecked.value = status;
    }

    const onChecked = () => {
        emit('on-checked', isAllChecked.value);
    };

    const onDelete = () => {
        emit('on-delete');
    };

    onBeforeMount(() => {
        if (props.data) {
            localMenu.value = [...props.data, ...localMenu.value];
        }
    });

    defineExpose({
        isAllChecked,
    });
</script>
<template>
    <th class="table-actions-components text-left" style="opacity: 1; max-width: 115px; width: 115px">
        <q-checkbox color="primary" v-model="isAllChecked" @update:model-value="onChecked" />
        <q-btn icon="menu" class="table-actions-components__btn" round>
            <q-menu anchor="top right" self="top left" class="table-actions-components__menu" :offset="[10, -2]">
                <q-list class="table-actions-components__menu__list" style="min-width: 100px">
                    <template v-for="(item, index) in localMenu" :key="index">
                        <q-item v-if="item.isView" class="table-actions-components__menu__item" v-close-popup>
                            <q-item-section v-if="item.isView" class="table-actions-components__menu__item__content" @click="item.action">
                                <div class="row items-center no-wrap">
                                    <q-icon :name="item.icon" class="q-mr-sm" />
                                    {{ item.name }}
                                </div>
                            </q-item-section>
                        </q-item>
                    </template>
                </q-list>
            </q-menu>
        </q-btn>
    </th>
</template>
<style lang="scss" scoped>
    .table-actions-components {
        &__menu {
            &__item {
                font-size: 14px;
                min-height: 40px;
                padding: 0;

                &__content {
                    padding: 5px 10px;

                    i {
                        color: var(--q-gray);
                        font-size: 16px;
                    }
                }
            }
        }
    }
</style>

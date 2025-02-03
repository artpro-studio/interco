<script lang="ts" setup>
    import { computed, onBeforeMount, ref } from 'vue';
    import { ITableAction } from '../interface';

    interface IProps {
        row?: any;
        value: boolean;
        isDuplicate: boolean;
        isEdit: boolean;
        data?: ITableAction[];
    }

    const props = withDefaults(defineProps<IProps>(), {
        isDuplicate: false,
        isEdit: false,
    });
    const emit = defineEmits(['input', 'on-delete', 'on-checked', 'on-duplicate', 'on-edit']);

    const localMenu = ref<ITableAction[]>([
        {
            name: 'Редактировать',
            icon: 'edit',
            action: () => onEdit(),
            isView: props.isEdit,
        },
        {
            name: 'Удалить',
            icon: 'delete',
            action: () => onDelete(),
            isView: true,
        },
        {
            name: 'Удалить',
            icon: 'delete',
            action: () => {
                emit('on-duplicate');
            },
            isView: props.isDuplicate,
        },
    ]);

    const currentValue = computed({
        get: () => props.value,
        set: (value: boolean) => {
            emit('input', value);
        },
    });

    const onEdit = () => {
        emit('on-edit');
    };

    const onDelete = () => {
        emit('on-delete');
    };

    const isCheckIsView = (item: ITableAction) => {
        if (item.isView) {
            if (item.onIsView) {
                return item.onIsView(props.row);
            }
            return true;
        }
        return false;
    };

    onBeforeMount(() => {
        if (props.data) {
            localMenu.value = [...props.data, ...localMenu.value];
        }
    });
</script>
<template>
    <q-checkbox color="primary" v-model="currentValue" @update:model-value="emit('on-checked')" />
    <q-btn icon="menu" class="table-actions-components__btn" round>
        <q-menu anchor="top right" self="top left" class="table-actions-components__menu" :offset="[10, -2]">
            <q-list class="table-actions-components__menu__list" style="min-width: 100px">
                <template v-for="(item, index) in localMenu" :key="index">
                    <q-item v-if="isCheckIsView(item)" class="table-actions-components__menu__item" clickable v-close-popup>
                        <q-item-section class="table-actions-components__menu__item__content" @click="() => item.action(row)">
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
</template>
<style lang="scss" scoped>
    .table-actions-components {
        &__menu {
            i {
                color: var(--q-black-gray);
            }
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
<style lang="scss">
    .table-actions-components {
        &__btn {
            .q-btn__content {
                i {
                    font-size: 18px;
                }
            }
        }
    }
</style>

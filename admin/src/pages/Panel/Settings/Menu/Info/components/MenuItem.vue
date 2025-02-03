<script lang="ts" setup>
    import { VueDraggableNext } from 'vue-draggable-next';
    import { SettingsMenuItemDto } from '@/ApiClient/ApiClient';
    import { onBeforeMount, Ref, ref } from 'vue';

    interface IProps {
        rows: SettingsMenuItemDto[];
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-create-points', 'on-open-edit', 'on-open-delete', 'on-end']);

    const localRows: Ref<SettingsMenuItemDto[]> = ref([]);

    onBeforeMount(() => {
        localRows.value = props.rows;
    });
</script>
<template>
    <div class="menu-form-components__wrap">
        <vue-draggable-next :list="localRows" class="menu-form-components__draggable" @end="emit('on-end', $event)">
            <div v-for="item in localRows" :key="item.id" class="menu-form-components__item">
                <div class="menu-form-components__item__header row items-center justify-between">
                    <div class="row items-center">
                        <q-icon name="menu" class="q-mr-sm" />
                        <div class="menu-form-components__item__title">{{ item.title }}</div>
                    </div>
                    <div class="row items-center">
                        <q-btn color="primary" icon="add" round flat @click="emit('on-create-points', item.id)"></q-btn>
                        <q-btn color="primary" icon="o_edit" round flat @click="emit('on-open-edit', item.id)"></q-btn>
                        <q-btn
                            color="primary"
                            icon="o_delete"
                            round
                            flat
                            @click="emit('on-open-delete', item.id)"
                        ></q-btn>
                    </div>
                </div>
                <div class="menu-form-components__item__body">
                    <menu-item
                        :rows="item.children"
                        @on-create-points="emit('on-create-points', $event)"
                        @on-open-edit="emit('on-open-edit', $event)"
                        @on-open-delete="emit('on-open-delete', $event)"
                        @on-end="emit('on-end', $event)"
                    />
                </div>
            </div>
        </vue-draggable-next>
        <div class="menu-form-components__no-items" v-if="localRows.length === 0">Нету подпунктов</div>
    </div>
</template>
<style lang="scss" scoped>
    .menu-form-components {
        &__wrap {
            position: relative;
        }
        &__no-items {
            position: absolute;
            top: 100%;
            left: 0;
            margin-top: -20px;
            opacity: 0.6;
            font-size: 0.85em;
        }
        &__draggable {
            min-height: 20px;
        }
        &__item {
            background-color: #f7f7fa;
            margin-bottom: 10px;

            &__header {
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
                transition: 0.4s all;
                border-bottom: 1px rgba(0, 0, 0, 0.1) solid;
                &:hover {
                    background-color: #efeff5;
                }
            }
            &__body {
                padding: 0 25px;
            }
        }
    }
</style>

<script lang="ts" setup>
    import {
        getApiClientInitialParams,
        SettingsContactsControllerClient,
        SettingsContactsDto,
    } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { onMounted, PropType, Ref, ref, toRefs } from 'vue';
    import SettingsContentCreate from './SettingsContentCreate.vue';

    const { resultError } = useResultException();

    const emit = defineEmits(['update:modelValue']);

    const props: {
        value: SettingsContactsDto[];
        label: string;
        isPhone: boolean;
    } = defineProps({
        value: {
            type: Array as PropType<SettingsContactsDto[]>,
            required: true,
        },
        label: {
            type: String,
            default: 'Телефоны',
        },
        isPhone: {
            type: Boolean,
            default: false,
        },
    });

    const { value } = toRefs(props);
    const options: Ref<SettingsContactsDto[]> = ref([]);
    const createOrUpdate: Ref<{
        isOpen: boolean;
        id: number | null;
    }> = ref({
        isOpen: false,
        id: null,
    });

    const closeCreate = () => {
        createOrUpdate.value.isOpen = false;
        createOrUpdate.value.id = null;
    };

    const openEdit = (id: number) => {
        createOrUpdate.value.isOpen = true;
        createOrUpdate.value.id = id;
    };

    const removeItem = (id: number) => {
        const findIndex = value.value.findIndex((el) => el.id === id);
        if (findIndex > -1) {
            value.value.splice(findIndex, 1);
            emit('update:modelValue', value.value);
        }
    };

    const getInfo = async () => {
        closeCreate();
        const result = await new SettingsContactsControllerClient(getApiClientInitialParams()).get(props.isPhone);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            options.value = result.entity!;
        }
    };

    onMounted(() => {
        getInfo();
    });
</script>

<template>
    <div class="settings-content row no-wrap items-center">
        <q-select
            v-model="value"
            class="settings-content__select q-mr-md"
            :label="label"
            :options="options"
            option-label="content"
            @update:model-value="emit('update:modelValue', $event)"
            multiple
            use-chips
            outlined
        >
            <template v-slot:selected>
                <q-chip
                    v-for="item in props.value"
                    :key="'select-' + item.id"
                    @click.prevent.stop="openEdit(item.id!)"
                    dense
                    square
                    class="settings-content__select__chip q-my-none q-ml-xs q-mr-none"
                    clickable
                >
                    {{ item.content }}
                    <q-icon
                        name="close"
                        class="settings-content__select__close"
                        @click.prevent.stop="removeItem(item.id)"
                    />
                </q-chip>
            </template>
        </q-select>
        <q-btn
            class="settings-content__btn"
            icon="add"
            color="primary"
            @click="createOrUpdate.isOpen = !createOrUpdate.isOpen"
            flat
            round
        >
            <q-tooltip>Добавить</q-tooltip>
        </q-btn>
    </div>
    <q-dialog v-model="createOrUpdate.isOpen">
        <settings-content-create
            :is-phone="props.isPhone"
            :id="createOrUpdate.id"
            @close="closeCreate"
            @success="getInfo"
        />
    </q-dialog>
</template>
<style lang="scss" scoped>
    .settings-content {
        width: 100%;
        &__select {
            width: 100%;

            &__close {
                margin-left: 5px;
                background-color: #cbcbcb;
                border-radius: 50%;
                font-size: 13px;
                padding: 1px;
            }
        }

        &__btn {
            width: 42px;
            height: 42px;
            min-width: 42px;
        }
    }
</style>

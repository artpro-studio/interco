<!-- eslint-disable @typescript-eslint/no-unused-vars -->
<script lang="ts" setup>
    import { ITemplateComponents, ITemplateComponentsField, ITemplateComponentsType } from 'src/ApiClient/ApiClient';
    import { computed, onBeforeMount, PropType, Ref, ref, toRefs } from 'vue';
    import LandingItemEdit from './LandingItemEdit.vue';
    import CustomModals from '@/components/Modals/CustomModals.vue';

    const emit = defineEmits(['on-success', 'order-up', 'order-down', 'delete']);

    const prop: {
        item: ITemplateComponents;
    } = defineProps({
        item: {
            type: Object as PropType<ITemplateComponents>,
            required: true,
        },
    });

    const { item } = toRefs(prop);
    const localItem: Ref<ITemplateComponents | null> = ref(null);
    const isEdit: Ref<boolean> = ref(false);

    const getData = computed(() => {
        const returnData: any = {};
        localItem.value?.fields.forEach((el: ITemplateComponentsField) => {
            if (el.type !== ITemplateComponentsType.ARRAY) {
                let value: any = null;
                if (el.type === ITemplateComponentsType.IMAGE) {
                    value = el.value || null;
                } else {
                    value = el.value ? el.value : el.default;
                }
                returnData[el.name] = value;
            } else {
                el.fields?.forEach((fieldItem: any) => {
                    const localField: any = {};
                    fieldItem.forEach((field: ITemplateComponentsField) => {
                        localField[field.name] = field.value || field.default;
                    });
                    if (!returnData[el.name]) {
                        returnData[el.name] = [];
                    }
                    returnData[el.name].push(localField);
                });
            }
        });

        return returnData;
    });

    const parseGetData = (entity: ITemplateComponentsField) => {
        if (entity.type !== ITemplateComponentsType.ARRAY) {
            return {
                [entity.name]: entity.value || entity.default,
            };
        } else {
            const fields: any = {};
            fields[entity.name] = [];
            let obj = {};
            entity.fields?.forEach((item: any) => {
                item.forEach((el: ITemplateComponentsField) => {
                    obj = {
                        ...obj,
                        ...parseGetData(el),
                    };
                });
            });
            fields[entity.name].push({ ...obj });
            return {
                ...fields,
            };
        }
    };

    const onSuccessField = () => {
        isEdit.value = false;
        emit('on-success', localItem.value);
    };

    const closeEditField = () => {
        isEdit.value = false;
        localItem.value = JSON.parse(JSON.stringify(localItem.value));
    };

    const changeField = (event: ITemplateComponentsField[]) => {
        localItem.value!.fields = event;
        localItem.value = JSON.parse(JSON.stringify(localItem.value));
    };

    onBeforeMount(() => {
        localItem.value = JSON.parse(JSON.stringify(item.value));
    });
</script>

<template>
    <div class="langind-item-components" @dblclick="isEdit = !isEdit">
        <div class="langind-item-components__popover">
            <q-icon
                name="keyboard_arrow_up"
                class="langind-item-components__popover__item"
                @click="emit('order-up', item)"
            />
            <q-icon
                name="keyboard_arrow_down"
                class="langind-item-components__popover__item"
                @click="emit('order-down', item)"
            />
            <q-icon name="close" class="langind-item-components__popover__item" @click="emit('delete', item)" />
        </div>
        <div class="langind-item-components__popover-text">
            <div class="langind-item-components__popover-text__body text-center">
                <div class="text-h5">Кликнике 2 раза по блоку</div>
                <div>Чтобы открыть редактирование блока</div>
            </div>
        </div>
        <component v-if="localItem && localItem.name" v-bind:is="localItem.name" :data="getData" />
    </div>
    <custom-modals :modal-value="isEdit">
        <landing-item-edit
            :item="localItem"
            @change="changeField"
            @on-success="onSuccessField"
            @close="closeEditField"
        />
    </custom-modals>
    <!-- <q-dialog class="landing-item-components__modal" v-model="isEdit" full-height full-width no-backdrop-dismiss>
    </q-dialog> -->
</template>
<style lang="scss" scoped>
    .langind-item-components {
        position: relative;

        &:hover {
            &::before {
                opacity: 1;
            }
            .langind-item-components__popover {
                display: flex;
            }

            .langind-item-components__popover-text {
                opacity: 1;
            }
        }

        &::before {
            content: '';
            width: 100%;
            height: 100%;
            border: 3px var(--q-primary) solid;
            position: absolute;
            top: 0;
            left: 0;
            transition: 0.4s all;
            opacity: 0;
        }

        &__popover {
            position: absolute;
            top: 0px;
            left: calc(50% - 50px);
            right: auto;
            background-color: var(--q-primary);
            width: 100px;
            margin: 0 auto;
            text-align: center;
            color: #fff;
            font-size: 18px;
            border-radius: 0 0 5px 5px;
            display: none;
            justify-content: center;
            align-items: center;
            padding: 5px 0;
            z-index: 3;

            &__item {
                margin: 0 3px;
                cursor: pointer;
            }
        }

        &__popover-text {
            position: absolute;
            top: 3px;
            left: 3px;
            width: calc(100% - 6px);
            height: calc(100% - 6px);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            background-color: rgba(0, 0, 0, 0.7);
            opacity: 0;
            transition: 0.4s all;
        }
    }
</style>
<style lang="scss">
    .landing-item-components {
        &__modal {
            .q-dialog__backdrop {
                opacity: 0;
            }
        }
    }
</style>

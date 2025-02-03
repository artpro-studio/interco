<!-- eslint-disable @typescript-eslint/no-unused-vars -->
<script lang="ts" setup>
    import { ITemplateComponents, ITemplateComponentsField, ITemplateComponentsType } from 'src/ApiClient/ApiClient';
    import { onBeforeMount, onMounted, PropType, Ref, ref } from 'vue';
    import LandingFields from './LandingFields.vue';
    import LandingItemEditArray from './LandingItemEditArray.vue';

    const emit = defineEmits(['change', 'on-success', 'close']);
    const prop: {
        item: ITemplateComponents;
    } = defineProps({
        item: {
            type: Object as PropType<ITemplateComponents>,
            required: true,
        },
    });

    const isLoading = ref(false);
    const QSrollBody = ref(null);
    const Header = ref(null);
    const Buttons = ref(null);
    const heightScroll: Ref<string> = ref('0px');
    const form: Ref<any> = ref([]);
    const isSmallWidth: Ref<boolean> = ref(true);

    const heightScrollBody = () => {
        const heightHeader = (Header.value! as HTMLElement).offsetHeight + 16;
        const heightButtons = (Buttons.value! as HTMLElement).offsetHeight;
        const amountHeight = heightHeader + heightButtons + 48 + 70;
        heightScroll.value = `calc(100vh - ${amountHeight}px)`;
    };

    const swapElements = (array, index1, index2) => {
        let temp = array[index1];
        array[index1] = array[index2];
        array[index2] = temp;
    };

    const changeField = () => {
        emit('change', form.value);
    };

    const updateField = (event: any, index: number) => {
        form.value[index].value = event;
        changeField();
    };

    const updateFieldArray = (data: { event: any; indx: number; i: number }, index: number) => {
        form.value[index].fields[data.indx][data.i].value = data.event;
        changeField();
    };

    const onUpField = (name: string, index: number) => {
        const indx = form.value.findIndex((el) => el.name == name);
        if (indx && indx > -1) {
            swapElements(form.value[indx].fields, index, index - 1);
        }

        changeField();
    };

    const onDownField = (name: string, index: number) => {
        const indx = form.value.findIndex((el) => el.name == name);
        if (indx && indx > -1) {
            swapElements(form.value[indx].fields, index, index + 1);
        }

        changeField();
    };

    const onDeleteField = (name: string, index: number) => {
        const indx = form.value.findIndex((el) => el.name == name);
        if (indx && indx > -1) {
            form.value[indx].fields.splice(index, 1);
        }

        changeField();
    };

    const onAddNewField = (name: string) => {
        const index = form.value.findIndex((el) => el.name == name);

        if (index && index > -1) {
            console.log(index);
            const newItem: ITemplateComponentsField[] = [];
            console.log(form.value[index]);
            form.value[index].defaultFields.forEach((itemField: ITemplateComponentsField) => {
                newItem.push({
                    type: itemField.type,
                    label: itemField.label || '',
                    name: itemField.name,
                    value: itemField.value || itemField.default || '',
                    default: itemField.default,
                });
            });

            form.value[index].fields.push(JSON.parse(JSON.stringify(newItem)));
        }

        changeField();
    };

    // Рекурсия по парсу полей fields
    function getParseFormatFields(entity: ITemplateComponentsField): any {
        if (entity.type !== ITemplateComponentsType.ARRAY) {
            return {
                ...entity,
                value: entity.value || entity.default || '',
            };
        } else {
            const field: any = {
                type: entity.type,
                label: entity.label || '',
                name: entity.name,
                fields: [],
            };
            const localField: any = [];
            entity.fields?.forEach((item: ITemplateComponentsField[]) => {
                item.forEach((el: ITemplateComponentsField) => {
                    localField.push(getParseFormatFields(el));
                });
            });
            field.fields.push(localField);
            return field;
        }
    }

    const parseForm = () => {
        prop.item.fields.forEach((el: ITemplateComponentsField) => {
            if (el.type !== ITemplateComponentsType.ARRAY) {
                let value: any = null;
                if (el.type === ITemplateComponentsType.IMAGE) {
                    value = el.value || null;
                } else {
                    value = el.value ? el.value : el.default;
                }
                form.value.push({
                    type: el.type,
                    label: el.label || '',
                    name: el.name,
                    value: value,
                    default: el.default,
                });
            } else {
                const field: any = {
                    type: el.type,
                    label: el.label || '',
                    name: el.name,
                    fields: [],
                    defaultFields: el.defaultFields,
                };
                el.fields?.forEach((item: any) => {
                    const localField: any = [];
                    item.forEach((itemField: ITemplateComponentsField) => {
                        localField.push({
                            type: itemField.type,
                            label: itemField.label || '',
                            name: itemField.name,
                            value: itemField.value || itemField.default || '',
                            default: itemField.default,
                        });
                    });
                    field.fields.push([...localField]);
                });
                form.value.push(field);
            }
        });
    };

    onBeforeMount(() => {
        parseForm();
    });

    onMounted(() => {
        heightScrollBody();
    });
</script>

<template>
    <q-card class="landing-item-edit-components" :class="{ 'is-small': isSmallWidth }">
        <q-card-section>
            <div ref="Header" class="landing-item-edit-components__header q-mb-md">
                <div class="landing-item-edit-components__header__title text-h5">Редактирования блока</div>
            </div>
            <q-scroll-area
                ref="QSrollBody"
                class="landing-item-edit-components__body"
                :style="{ height: heightScroll }"
            >
                <div class="q-pa-md flex flex-center" v-if="isLoading">
                    <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
                </div>
                <q-form v-if="!isLoading" class="landing-item-edit-components__form">
                    <div
                        class="landing-item-edit-components__form__field q-mb-md"
                        v-for="(fItem, index) in form"
                        :key="index"
                    >
                        <landing-fields
                            v-if="fItem.type !== ITemplateComponentsType.ARRAY"
                            :item="fItem"
                            @update="updateField($event, index)"
                        />
                        <landing-item-edit-array
                            v-else
                            :item="fItem"
                            @update="updateFieldArray($event, index)"
                            @on-add="onAddNewField"
                            @on-up-field="onUpField(fItem.name, $event)"
                            @on-down-field="onDownField(fItem.name, $event)"
                            @on-delete-field="onDeleteField(fItem.name, $event)"
                        />
                    </div>
                </q-form>
            </q-scroll-area>
            <div ref="Buttons" class="landing-item-edit-components__buttons">
                <q-btn color="primary" @click="emit('on-success')">Сохранить</q-btn>
                <q-btn class="q-ml-md" @click="emit('close')">Отмена</q-btn>
            </div>
        </q-card-section>
        <div class="landing-item-edit-components__resize" @click="isSmallWidth = !isSmallWidth">
            <q-icon :name="isSmallWidth ? 'chevron_left' : 'chevron_right'"></q-icon>
        </div>
    </q-card>
</template>
<style lang="scss">
    .landing-item-edit-components__form__array-fields__item__body__expansion {
        .q-item {
            padding: 0;
            min-height: auto;

            .q-focus-helper {
                display: none;
            }
        }
    }
</style>
<style lang="scss" scoped>
    .landing-item-edit-components {
        max-width: 700px !important;
        margin-left: auto;
        margin-right: 0;
        position: relative;
        overflow: initial;

        &.is-small {
            max-width: 350px !important;
        }

        &__resize {
            position: absolute;
            top: calc(50% - 30px);
            left: -15px;
            width: 30px;
            height: 30px;
            background-color: rgba(24, 30, 56, 0.5);
            color: #fff;
            font-size: 24px;
            border-radius: 3px !important;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.4s all;

            &:hover {
                background-color: rgba(24, 30, 56, 1);
            }
        }

        &__header {
            border-bottom: 1px rgba(0, 0, 0, 0.1) solid;
            padding-bottom: 20px;
        }

        &__body {
            margin-bottom: 20px;
        }

        &__form {
            padding-top: 5px;
        }
    }
</style>
<style lang="scss">
    .landing-item-edit-components {
        &__expansion-item {
            background-color: #f7f7fa;
            .q-item__section--side {
                min-width: auto;
                padding-right: 10px;
            }
            .q-item__label {
                font-size: 14px;
            }

            &__body {
                background-color: #f7f7fa;
                padding: 15px 15px;
            }
        }

        &__form {
            &__array-fields {
                border-top: 1px rgba(0, 0, 0, 0.1) solid;
                .landing-item-edit-components__form__array-fields {
                    padding-top: 0;
                }

                &__item {
                    background-color: #f7f7fa;
                    padding: 15px 10px 15px 5px;
                    margin-bottom: 20px;

                    &__body {
                        width: 100%;

                        &__controll {
                            width: 100%;
                        }
                    }

                    &__btn {
                        min-width: 21px;
                        min-height: 21px;
                        margin-right: 5px;
                        height: 21px;
                        font-size: 12px;
                    }
                }
            }
        }
    }
</style>

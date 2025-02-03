<script lang="ts" setup>
    import { useQuasar } from 'quasar';
    import { VueDraggableNext } from 'vue-draggable-next';
    import { TemplateComponentsData } from 'src/template/index';
    import {
        CreatePagesComponents,
        getApiClientInitialParams,
        ITemplateComponents,
        ITemplateComponentsField,
        ITemplateComponentsType,
        PagesComponentsControllerClient,
        PagesComponentsDto,
    } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { onMounted, Ref, ref, watch, nextTick } from 'vue';
    import { useRoute } from 'vue-router';
    import LandingItem from './LandingItem.vue';

    const $q = useQuasar();
    const route = useRoute();
    const { resultError } = useResultException();

    const emit = defineEmits(['close']);

    const sidebarHeader = ref(null);
    const sidebarButtons = ref(null);
    const sidebarBody: Ref<string> = ref('0px');
    const isSmallSidebar: Ref<boolean> = ref(false);

    const isLoading: Ref<boolean> = ref(true);
    const items: Ref<ITemplateComponents[]> = ref([]);
    const dropZona: Ref<ITemplateComponents[]> = ref([]);
    const row: Ref<ITemplateComponents[]> = ref([]);
    const isCreate: Ref<boolean> = ref(false);
    const groupList = {
        name: 'screen',
        pull: 'clone',
        put: false,
    };

    // Отслеживаем перемещение элемента в дропзону
    watch(dropZona, (newDropZona: ITemplateComponents[]) => {
        if (newDropZona && newDropZona[0]) {
            isLoading.value = true;
            items.value.splice(newDropZona[0]!.order!, 0, newDropZona[0]);
            getParseFormat(newDropZona[0]);
            onUpdateOrderRow();
            //dropZona.value = [];
            nextTick(() => {
                dropZona.value = [];
                isLoading.value = false;
            });
        }
    });

    // Обновлнение порядка сортировки
    const onUpdateOrderRow = () => {
        row.value = row.value.map((el: ITemplateComponents, index: number) => {
            return {
                ...el,
                order: index,
            };
        });
    };

    const onDragDrop = (event: any) => {
        row.value.push({
            ...(event.added.element as ITemplateComponents),
            order: row.value.length + 1,
        });
        dropZona.value = [];
    };

    // Добавление компонента при двойном клике
    const onAddComponents = (event: ITemplateComponents) => {
        row.value.push({
            ...event,
            order: 0,
        });
        onUpdateOrderRow();
    };

    // Поднимаем компонент по сортировки вверх
    const onOrderUp = async (event: ITemplateComponents) => {
        isLoading.value = true;

        const index = row.value.findIndex((el: any) => el === event);
        if (index > -1 && index !== 0) {
            row.value.splice(index, 1);
            row.value.splice(index - 1, 0, event);
            onUpdateOrderRow();
        }
        nextTick(() => {
            isLoading.value = false;
        });
    };
    // Опускаем компонент вниз по сортировке
    const onOrderDown = (event: ITemplateComponents) => {
        isLoading.value = true;

        const index = row.value.findIndex((el: ITemplateComponents) => el === event);
        if (index > -1 && index !== row.value.length) {
            row.value.splice(index, 1);
            row.value.splice(index + 1, 0, event);
            onUpdateOrderRow();
        }

        nextTick(() => {
            isLoading.value = false;
        });
    };

    // Формирования JSON формата
    function getParseFormatJSON(entity: ITemplateComponentsField): any {
        if (entity.type !== ITemplateComponentsType.ARRAY) {
            let value: any = null;
            if (entity.type === ITemplateComponentsType.IMAGE) {
                value = entity.value || null;
            } else {
                value = entity.value ? entity.value : entity.default;
            }
            return {
                [entity.name]: value,
            };
        } else {
            const content: any = {
                [entity.name]: [],
            };
            entity.fields?.forEach((item: any) => {
                let localObj: any = {};
                item.forEach((itemField: ITemplateComponentsField) => {
                    localObj = {
                        ...localObj,
                        ...getParseFormatJSON(itemField),
                    };
                });
                content[entity.name].push(localObj);
            });
            return content;
        }
    }
    // Публикация страницы
    const onPublick = async () => {
        const json: PagesComponentsDto[] = row.value.map((el: ITemplateComponents, index: number) => {
            let content: any = {};
            el.fields.forEach((field: ITemplateComponentsField) => {
                content = {
                    ...content,
                    ...getParseFormatJSON(field),
                };
            });
            return {
                id: el.id || undefined,
                name: el.name,
                order: index,
                content,
            };
        });

        const formCreate: CreatePagesComponents = {
            idPage: Number(route.params.id),
            fields: json,
        };

        if (isCreate.value) {
            const result = await new PagesComponentsControllerClient(getApiClientInitialParams()).create(formCreate);

            if (!result.isSuccess) {
                resultError(result, null);
            }
        } else {
            const result = await new PagesComponentsControllerClient(getApiClientInitialParams()).update(formCreate);

            if (!result.isSuccess) {
                resultError(result, null);
            }
        }

        $q.notify({
            color: 'positive',
            textColor: 'white',
            icon: 'check',
            message: 'Страница опубликована',
        });
        emit('close');
    };

    // Удаление компонента
    const onDelete = async (event: any) => {
        isLoading.value = true;

        const index = row.value.findIndex((el: any) => el === event);
        if (index > -1) {
            if (event.id) {
                const result = await new PagesComponentsControllerClient(getApiClientInitialParams()).delete(event.id);
                if (!result.isSuccess) {
                    resultError(result, null);
                }
            }
            row.value.splice(index, 1);
            onUpdateOrderRow();
        }

        nextTick(() => {
            isLoading.value = false;
        });
    };

    // Обновление компонента после изменения
    const onSuccess = (event: any) => {
        const index = row.value.findIndex((el: any) => el.id === event.id);
        if (index > -1) {
            row.value[index] = JSON.parse(JSON.stringify(event));
        }
    };

    // Вычисление высоты сайдбара
    const getHeightSidebar = () => {
        const heightHeader = (sidebarHeader.value! as HTMLElement).offsetHeight + 16;
        const heightButtons = (sidebarButtons.value! as HTMLElement).offsetHeight;
        const amountHeight = heightHeader + heightButtons + 48 + 50;
        sidebarBody.value = `calc(100vh - ${amountHeight}px)`;
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
                defaultFields: entity.fields,
            };
            const localField: any = [];
            entity.fields?.forEach((el: ITemplateComponentsField) => {
                localField.push({
                    ...getParseFormatFields(el),
                });
            });
            field.fields.push([...localField]);
            return field;
        }
    }

    // Преобрзование в нужный формат данных при добалвнение компонента в дропзону
    const getParseFormat = (entity: ITemplateComponents) => {
        const componentsFields = entity.fields.map((item: ITemplateComponentsField) => {
            return getParseFormatFields(item);
        });
        row.value.push({
            ...entity,
            fields: componentsFields,
        });
    };

    // Рекурсия по парсу полей fields
    function getParseFormatFieldsResult(entity: ITemplateComponentsField, result: any): any {
        if (entity.type !== ITemplateComponentsType.ARRAY) {
            let value: any = null;
            if (entity.type === ITemplateComponentsType.IMAGE) {
                if (result.content) {
                    value = result.content ? result.content[entity.name] : [];
                } else {
                    value = result ? result[entity.name] : [];
                }
                console.log('images', value, result, entity.name);
            } else {
                if (result.content) {
                    value = result && result.content ? result.content[entity.name] : entity.default;
                } else {
                    value = result ? result[entity.name] : entity.default;
                }
            }

            return {
                ...entity,
                value: value,
            };
        } else {
            const field: any = {
                type: entity.type,
                label: entity.label || '',
                name: entity.name,
                fields: [],
                defaultFields: entity.fields,
            };
            result.content[entity.name].forEach((itemContent: any) => {
                const localField: any = [];
                entity.fields?.forEach((itemField: ITemplateComponentsField) => {
                    localField.push({
                        ...getParseFormatFieldsResult(itemField, itemContent),
                    });
                });
                field.fields.push([...localField]);
            });
            return field;
        }
    }

    // Перобразование в нужный формат данных полученные с бека
    const getParseFormatResult = (entity: PagesComponentsDto[]) => {
        entity.forEach((el: PagesComponentsDto, index: number) => {
            const thisComponents = items.value.find((elComponents: ITemplateComponents) => elComponents.name === el.name);
            if (thisComponents) {
                const jsonComponents = JSON.parse(JSON.stringify(thisComponents));
                thisComponents.fields.map((item: ITemplateComponentsField) => {
                    const field = getParseFormatFieldsResult(item, el);
                    if (field) {
                        jsonComponents.fields.push(field);
                    }
                });
                jsonComponents.fields = thisComponents.fields.map((item: ITemplateComponentsField) => {
                    return getParseFormatFieldsResult(item, el);
                });
                row.value.push({
                    ...jsonComponents,
                    id: el.id,
                    order: index,
                });
            }
        });
    };

    // Получаем данные по странице
    const getInfo = async () => {
        const result = await new PagesComponentsControllerClient(getApiClientInitialParams()).get(Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            getParseFormatResult(result.entity!.entity!);
            isCreate.value = result.entity!.entity!.length === 0;
        }
    };

    onMounted(() => {
        (TemplateComponentsData as ITemplateComponents[]).forEach((el: ITemplateComponents, index: number) => {
            items.value.push({
                ...el,
                order: index,
            });
        });
        getInfo();
        isLoading.value = false;

        nextTick(() => {
            getHeightSidebar();
        });
    });
</script>

<template>
    <div class="q-pa-md flex flex-center" v-if="isLoading">
        <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
    </div>
    <div class="editor-landing-components row no-wrap" v-else>
        <div class="editor-landing-components__sidebar" :class="{ 'is-small': isSmallSidebar }">
            <div ref="sidebarHeader" class="editor-landing-components__sidebar__header row items-center">
                <q-icon name="apps" color="primary" size="24px" class="cursor-pointer" @click="isSmallSidebar = !isSmallSidebar">
                    <q-tooltip>{{ isSmallSidebar ? 'Показать' : 'Скрыть' }} сайдбар</q-tooltip>
                </q-icon>
                <div class="editor-landing-components__sidebar__header__body q-ml-sm" v-if="!isSmallSidebar">
                    <div class="editor-landing-components__sidebar__title text-h5">Выберите элемент</div>
                    <div class="editor-landing-components__sidebar__desc">И перетащите на поле</div>
                </div>
            </div>
            <q-scroll-area v-if="!isSmallSidebar" class="editor-landing-components__sidebar__wrap q-mb-md" :style="{ height: sidebarBody }">
                <vue-draggable-next :list="items" :group="groupList" :sort="true">
                    <div v-for="item in items" :key="item.name">
                        <div class="editor-landing-components__sidebar__item" @dblclick="onAddComponents(item)">
                            <q-icon :name="item.icon" />
                            <div class="editor-landing-components__sidebar__item__title">{{ item.title }}</div>
                        </div>
                    </div>
                </vue-draggable-next>
            </q-scroll-area>
            <div v-if="!isSmallSidebar" ref="sidebarButtons" class="editor-landing-components__sidebar__buttons">
                <q-btn color="primary" class="q-mb-sm full" @click="onPublick">Опубликовать</q-btn>
                <q-btn class="full" @click="emit('close')">Отмена</q-btn>
            </div>
        </div>
        <q-scroll-area class="editor-landing-components__body" style="height: clac(100vh - 150px)">
            <q-card class="editor-landing-components__body__wrap">
                <div v-for="(item, index) in row" :key="index">
                    <landing-item :item="item" @on-success="onSuccess" @order-up="onOrderUp" @order-down="onOrderDown" @delete="onDelete" />
                </div>
            </q-card>
            <div class="editor-landing-components__body__wrap">
                <vue-draggable-next
                    :list="dropZona"
                    group="screen"
                    class="editor-landing-components__body__drag"
                    @change="onDragDrop"
                    :class="{ 'no-items': !!dropZona.length }"
                >
                    <div v-for="item in dropZona" :key="item.name" class="editor-landing-components__body__drag__item">
                        <q-icon :name="item.icon" />
                        <div class="editor-landing-components__body__drag__item__title">{{ item.title }}</div>
                    </div>
                </vue-draggable-next>
            </div>
        </q-scroll-area>
    </div>
</template>
<style lang="scss" scoped>
    .editor-landing-components {
        overflow-y: visible;
        &__body {
            width: 100%;
            &__drag {
                min-width: 500px;
                height: 200px;
                border: 3px rgba(255, 255, 255, 0.4) dashed;
                border-radius: 5px;
                margin-top: 20px;
                position: relative;

                &::before {
                    content: 'Перетащите сюда компонент';
                    color: #fff;
                    width: 100%;
                    position: absolute;
                    text-align: center;
                    top: 50%;
                    margin-top: -10px;
                }

                &__item {
                    font-size: 0.9em;
                    text-align: center;
                    width: calc(50% - 10px);
                    margin: 10px;
                    padding: 5px;
                    min-height: 50px;
                    background-color: #f7f7fa;
                    cursor: pointer;

                    &__title {
                        margin-top: 3px;
                    }
                }
            }

            &__wrap {
                border-radius: 0px;
            }
        }

        &__sidebar {
            min-width: 300px;
            max-width: 300px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            margin-right: 20px;

            &.is-small {
                width: 65px;
                min-width: 50px;
            }

            &__desc {
                font-size: 0.8em;
                margin-top: 5px;
            }

            &__header {
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px rgba(0, 0, 0, 0.1) solid;
            }

            &__wrap {
                margin: 0 -10px;
            }

            &__item {
                font-size: 0.9em;
                text-align: center;
                width: 100%;
                padding: 5px;
                min-height: 50px;
                background-color: #f7f7fa;
                cursor: pointer;

                &__title {
                    margin-top: 3px;
                }
            }
        }
    }
</style>
<sltye lang="scss">
.editor-landing-components__sidebar__wrap {
    .q-scrollarea__content > div {
        display: flex;
        flex-wrap: wrap;
    }
    .q-scrollarea__content > div > div {
        width: calc(50% - 10px);
        margin: 5px;
    }
}
</sltye>

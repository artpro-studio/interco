<script lang="ts" setup>
    import { ITemplateComponentsField, ITemplateComponentsType } from 'src/ApiClient/ApiClient';
    import LandingFields from './LandingFields.vue';
    import { PropType } from 'vue';

    const emit = defineEmits(['update', 'on-add', 'on-up-field', 'on-down-field', 'on-delete-field']);
    const props: {
        item: ITemplateComponentsField;
    } = defineProps({
        item: {
            type: Object as PropType<ITemplateComponentsField>,
            required: true,
        },
    });

    const updateField = (event: any, indx: number, i: string) => {
        emit('update', {
            event,
            indx,
            i,
        });
    };

    const onAddNewField = () => {
        emit('on-add', props.item.name);
    };
</script>

<template>
    <div class="landing-item-edit-components__form__array-fields q-pt-md">
        <q-expansion-item
            header-class="landing-item-edit-components__expansion-item"
            icon="list"
            :label="props.item.label"
        >
            <div class="landing-item-edit-components__expansion-item__body">
                <div
                    v-for="(field, indx) in item.fields"
                    :key="indx"
                    class="landing-item-edit-components__form__array-fields__item row items-start no-wrap full"
                >
                    <q-btn icon="more_vert" class="landing-item-edit-components__form__array-fields__item__btn" round>
                        <q-menu anchor="center right" self="center right" class="main-sidebar__item__children">
                            <q-list class="main-sidebar__item__children__list">
                                <q-item
                                    v-if="indx !== 0"
                                    class="main-sidebar__item__children__list__item"
                                    clickable
                                    v-close-popup
                                    @click="emit('on-up-field', indx)"
                                >
                                    <q-item-section class="main-sidebar__item__children__list__item__section">
                                        Поднять выше
                                    </q-item-section>
                                </q-item>
                                <q-item
                                    v-if="item.fields?.length !== indx + 1"
                                    class="main-sidebar__item__children__list__item"
                                    clickable
                                    v-close-popup
                                    @click="emit('on-down-field', indx)"
                                >
                                    <q-item-section class="main-sidebar__item__children__list__item__section">
                                        Спустить ниже
                                    </q-item-section>
                                </q-item>
                                <q-item
                                    class="main-sidebar__item__children__list__item"
                                    clickable
                                    v-close-popup
                                    @click="emit('on-delete-field', indx)"
                                >
                                    <q-item-section class="main-sidebar__item__children__list__item__section">
                                        Удалить
                                    </q-item-section>
                                </q-item>
                            </q-list>
                        </q-menu>
                    </q-btn>
                    <div class="full">
                        <div v-for="(fieldChild, i) in field" :key="i">
                            <landing-fields
                                v-if="fieldChild.type !== ITemplateComponentsType.ARRAY"
                                :item="fieldChild"
                                class="q-mb-md"
                                @update="updateField($event, indx, i)"
                            />
                            <div v-else>
                                <landing-item-edit-array :item="fieldChild" @update="emit('update')" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="landing-item-edit-components__form__array-fields__add">
                    <q-btn @click="onAddNewField">Добавить новый элемент</q-btn>
                </div>
            </div>
        </q-expansion-item>
    </div>
</template>

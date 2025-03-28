<script lang="ts" setup>
    import { QForm } from 'quasar';
    import useResultException from 'src/helpers/useResultException';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { RouterName } from 'src/router/routerName';
    import { nextTick, onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import FormButtons from 'src/components/UI/FormButtons.vue';
    import SelectsPages from '../components/Selects/SelectsPages.vue';
    import CommentsTable from '../../components/Comments/CommentsTable.vue';
    import ParamsField from './components/ParamsField.vue';
    import RecordsSeoParams from './components/RecordsSeoParams/RecordsSeoParams.vue';
    import {
        CreateRecordsDto,
        DropDownDto,
        FullPagesParamsDto,
        getApiClientInitialParams,
        ILangPages,
        PagesControllerClient,
        PagesParamsControllerClient,
        PagesParamsDto,
        PagesParamsFieldDto,
        PagesSectionsControllerClient,
        PagesSectionsDto,
        RecordsControllerClient,
    } from 'src/ApiClient/ApiClient';

    const { resultError } = useResultException();
    const router = useRouter();
    const route = useRoute();
    const { isRequired } = useValidationRules();

    const isLoading = ref(true);
    const tab: Ref<string> = ref('form');
    const formRef = ref(null);
    const form: Ref<CreateRecordsDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        title: {
            value: [
                {
                    value: '',
                    lang: ILangPages.RuRU
                },
                {
                    value: '',
                    lang: ILangPages.EnUS
                },
                {
                    value: '',
                    lang: ILangPages.ZhCN
                },
            ]
        },
        description: {
            value: [
                {
                    value: '',
                    lang: ILangPages.RuRU
                },
                {
                    value: '',
                    lang: ILangPages.EnUS
                },
                {
                    value: '',
                    lang: ILangPages.ZhCN
                },
            ]
        },
        pages: null,
        countView: null,
        comments: null,
        paramsField: [],
        seo: {
            params: []
        }

    });
    const optionsPagesSections = ref<PagesSectionsDto[]>([]);

    const pagesParams = ref<FullPagesParamsDto[]>([]);

    const cleanHtml = (data: string) => {
        return data.replace(/<\/?div>/g, '');
    };

    const getFieldParams = (id: number) => {
        const find = form.value?.paramsField?.find((el) => el.params?.id === id);
        return find;
    };

    const onUpdateField = (event: PagesParamsFieldDto, params: PagesParamsDto) => {
        const findIndex = form.value?.paramsField?.findIndex((el) => el.params?.slug === params.slug);
        if (findIndex !== undefined && findIndex > -1) {
            form.value.paramsField![findIndex] = event;
        } else {
            form.value.paramsField?.push(event);
        }
    };

    const onRedirect = () => {
        if (route.query.page) {
            router.push({
                name: RouterName.PagesEdit,
                params: { id: Number(route.query.page) },
                query: { tab: 'records' },
            });
        } else {
            router.push({
                name: RouterName.Records,
            });
        }
    };

    const onCreate = async () => {
        const result = await new RecordsControllerClient(getApiClientInitialParams()).create(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity!;
            onRedirect();
        }
    };

    const onUpdate = async () => {
        const result = await new RecordsControllerClient(getApiClientInitialParams()).update(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            onRedirect();
        }
    };

    const onChange = () => {
        tab.value = 'form';
        nextTick(() => {
            (formRef.value! as QForm).validate().then((success: boolean) => {
                if (success) {
                    if (route.name === RouterName.PagesBlogsRecordsEdit) {
                        onUpdate();
                    } else {
                        onCreate();
                    }
                }
            });
        });
    };

    const onChangePage = (page: DropDownDto) => {
        if (page?.value) {
            getParams(Number(page?.value));
            getPagesDropDown(Number(page?.value));
            getPagesSections(page?.value);
        }
    };

    const getInfo = async () => {
        const result = await new RecordsControllerClient(getApiClientInitialParams()).getCreateOrUpdate(Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity!;

            getParams(result.entity!.pages!.value);
        }

        nextTick(() => {
            isLoading.value = false;
        });
    };

    const getPagesSections = async (page?: number) => {
        const result = await new PagesSectionsControllerClient(getApiClientInitialParams()).get('', 1, 100, page || Number(route.query.page));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            optionsPagesSections.value =
                result.entity?.entity || [];
        }
    };

    const getPagesDropDown = async (pageId?: number) => {
        const result = await new PagesControllerClient(getApiClientInitialParams()).getSelectIds([Number(route.query.page || pageId)]);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value.pages = result.entity.entity[0];
        }
    };

    const getParams = async (page: number) => {
        const result = await new PagesParamsControllerClient(getApiClientInitialParams()).get('', 1, 100, page);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            pagesParams.value = result.entity?.entity || [];
        }
    };

    const getNameOptions = (event: any) => {
        return event.title.map((el: any) => `${el.lang}: ${el.value}`).join(',');
    };

    onMounted(() => {
        nextTick(() => {
            if (route.query.page) {
                getPagesDropDown();
                getPagesSections();
            }
            if (route.name === RouterName.PagesBlogsRecordsEdit) {
                getInfo();
            } else {
                if (route.query.page) {
                    getParams(Number(route.query.page));
                }
                isLoading.value = false;
            }
        });
    });
</script>
<template>
    <div class="q-pa-md flex flex-center" v-if="isLoading">
        <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
    </div>
    <template v-else>
        <q-tabs v-model="tab" color="primary" active-color="primary" dense swipeable inline-label>
            <q-tab name="form" icon="settings" label="Основные настройки" />
            <q-tab name="params" icon="tune" label="Парамметры" />
            <q-tab v-if="route.name === RouterName.PagesBlogsRecordsEdit" name="comments" icon="tune" label="Комментарии" />
        </q-tabs>
        <q-tab-panels v-model="tab" animated transition-prev="jump-up" transition-next="jump-up">
            <q-tab-panel name="form">
                <q-card class="blogs-form-components section-create-form">
                    <q-card-section class="blogs-form-components__section">
                        <q-form ref="formRef" class="blogs-form-components__form" @submit="onChange">
                            <div class="section-create-form__field q-mb-md" v-if="!route.query.page">
                                <selects-pages v-model="form.pages" :multiple="false" @change="onChangePage" />
                            </div>
                            <div class="section-create-form__field q-mb-md">
                                <h4 class="text-h5 q-mb-lg">Название</h4>
                                <div class="blogs-form-components__title__body row no-wrap q-gutter-md">
                                    <q-input
                                        v-for="(item, index) in form.title?.value"
                                        :key="index"
                                        color="primary"
                                        v-model="item.value"
                                        :label="item.lang?.toString()"
                                        class="full"
                                        outlined
                                        lazy-rules
                                        :rules="[isRequired]"
                                    />
                                </div>
                            </div>
                            <div class="section-create-form__field q-mb-md">
                                <h4 class="text-h5 q-mb-lg">Описание</h4>
                                <div
                                    v-for="(item, index) in form.description?.value"
                                    :key="index"
                                    class="q-mb-md"
                                >
                                    <h4 class="text-h6 q-mb-md">{{ item.lang }}</h4>
                                    <q-editor
                                        v-model="item.value"
                                        class="full"
                                        :force-plain-text="true"
                                        :toolbar="[
                                            ['bold', 'italic', 'underline'],
                                            [{
                                                label: $q.lang.editor.formatting,
                                                icon: $q.iconSet.editor.formatting,
                                                list: 'no-icons',
                                                options: ['p', 'code']
                                            }]
                                        ]"
                                        @update:model-value="item.value = cleanHtml($event)"
                                    />
                                </div>
                            </div>
                            <div class="section-create-form__field q-mb-lg">
                                <q-select
                                    v-model="form.sections"
                                    label="Разделы"
                                    :options="optionsPagesSections"
                                    :option-label="getNameOptions"
                                    multiple
                                    outlined
                                    use-chips
                                />
                            </div>
                            <h4 class="text-h5 q-mb-lg">SEO парамметры</h4>
                            <records-seo-params
                                :data="form.seo?.params"
                                @on-change="form.seo = {
                                    params: $event
                                }"
                            />
                        </q-form>
                    </q-card-section>
                </q-card>
            </q-tab-panel>
            <q-tab-panel name="params" style="padding-bottom: 70px;">
                <div class="section-create-form__field q-mb-md" v-for="item in pagesParams" :key="item.id!">
                    <params-field
                        :data="getFieldParams(item.id!)"
                        :label="item.name"
                        :param="item"
                        @on-change="onUpdateField($event, item)"
                    />
                </div>
            </q-tab-panel>
            <q-tab-panel v-if="route.name === RouterName.PagesBlogsRecordsEdit" name="comments">
                <comments-table :record-id="Number(route.params.id)" />
            </q-tab-panel>
        </q-tab-panels>
        <form-buttons v-if="tab === 'params' || tab === 'form'" @success="onChange" />
    </template>
</template>
<style lang="scss" scoped>
    .blogs-form-components {
        &__section {
           @media (max-width: 600px) {
                padding: 0 !important;
           }
        }
        &__title {
            &__body {
                @media (max-width: 600px) {
                   flex-wrap: wrap;
                }
            }
        }
    }
</style>

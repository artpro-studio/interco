<script lang="ts" setup>
    import { getApiClientInitialParams, PagesControllerClient, PagesDto, PagesDtoType } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { RouterName } from 'src/router/routerName';
    import { onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import BlogsForm from './components/BlogsForm.vue';
    import BlogsRecords from './components/BlogsRecords.vue';
    import EditorLanding from './components/LangindEdit/EditorLanding.vue';
    import CustomModals from '@/components/Modals/CustomModals.vue';
    import CommentsTable from '../components/Comments/CommentsTable.vue';
    import TablePagesParams from './components/PagesParams/TablePagesParams.vue';
    import TableIblock from './components/Iblock/TableIblock.vue';

    const route = useRoute();
    const router = useRouter();
    const { resultError } = useResultException();

    const tab: Ref<string> = ref('form');
    const id: Ref<number | null> = ref(null);
    const isLoading: Ref<boolean> = ref(false);
    const form: Ref<PagesDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        name: '',
        description: '',
        pagePath: '',
        slug: '',
        type: PagesDtoType.Landing,
    });
    const isEditLanding: Ref<boolean> = ref(false);

    const changeTab = () => {
        router.replace({
            name: route.name?.toString(),
            query: { tab: tab.value },
        });
    };

    const getInfo = async () => {
        isLoading.value = true;
        const result = await new PagesControllerClient(getApiClientInitialParams()).getOne(id.value!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity! as PagesDto;
        }
        isLoading.value = false;
    };

    onMounted(() => {
        id.value = route.name === RouterName.PagesEdit ? Number(route.params.id) : null;
        tab.value = route.query.tab ? route.query.tab.toString() : tab.value;
        form.value.type = route.query.type === PagesDtoType.Blog ? PagesDtoType.Blog : PagesDtoType.Landing;
        if (id.value) {
            getInfo();
        } else {
            isLoading.value = false;
        }
    });
</script>

<template>
    <div class="container">
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <div class="product-create form-edit pages-edit-components" v-else>
            <q-tabs v-model="tab" color="primary" active-color="primary" dense swipeable inline-label @update:model-value="changeTab">
                <q-tab name="form" icon="settings" label="Основные настройки" />
                <q-tab v-if="route.name === RouterName.PagesEdit" name="iblock" icon="tune" label="Информационные блоки" />
                <q-tab v-if="route.name === RouterName.PagesEdit && form?.type === PagesDtoType.Blog" name="params" icon="tune" label="Парамметры" />
                <q-tab v-if="route.name === RouterName.PagesEdit && form?.type === PagesDtoType.Blog" name="records" icon="tune" label="Статьи" />
                <q-tab v-if="route.name === RouterName.PagesEdit && form?.type === PagesDtoType.Blog" name="comments" icon="tune" label="Комментарии" />
            </q-tabs>
            <q-tab-panels v-model="tab" animated transition-prev="jump-up" transition-next="jump-up">
                <q-tab-panel name="form">
                    <div v-if="form?.type === PagesDtoType.Landing" class="pages-edit-components__edit-landing-button text-center q-mb-lg">
                        <q-btn color="primary" @click="isEditLanding = !isEditLanding">Редактировать лендинг</q-btn>
                    </div>
                    <blogs-form :id="id" :form="form" />
                </q-tab-panel>
                <q-tab-panel name="iblock">
                    <table-iblock :page="form" />
                </q-tab-panel>
                <q-tab-panel name="params">
                    <table-pages-params />
                </q-tab-panel>
                <q-tab-panel name="records" v-if="route.name === RouterName.PagesEdit && form?.type === PagesDtoType.Blog">
                    <blogs-records :tab="tab" />
                </q-tab-panel>
                <q-tab-panel name="comments" v-if="route.name === RouterName.PagesEdit && form?.type === PagesDtoType.Blog">
                    <comments-table :page-id="Number(route.params.id)" />
                </q-tab-panel>
            </q-tab-panels>
        </div>
    </div>
    <custom-modals :modal-value="isEditLanding" full-width full-height>
        <editor-landing @close="isEditLanding = false" />
    </custom-modals>
</template>
<style lang="scss" scoped>
    .pages-edit-components {
        &__edit-landing-button {
            border: 1px rgba(0, 0, 0, 0.1) dashed;
            margin: 0 25px;
            padding: 20px;
        }
    }
</style>

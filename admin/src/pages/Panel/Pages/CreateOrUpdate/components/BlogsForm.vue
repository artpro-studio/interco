<script lang="ts" setup>
    import { QForm } from 'quasar';
    import { getApiClientInitialParams, PagesControllerClient, PagesDto, PagesDtoType, PagesType } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { RouterName } from 'src/router/routerName';
    import { nextTick, onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import Editor from 'src/components/Editor/Editor.vue';
    import FormButtons from 'src/components/UI/FormButtons.vue';
    import ModalsInfo from 'src/components/Modals/ModalsInfo.vue';
    import SelectPagesType from '../../components/Selects/SelectPagesType.vue';
    import SeoParams from './SeoParams/SeoParams.vue';
    import { templatePages } from '@/template';

    interface IProps {
        id?: number | null;
        form: PagesDto | null;
    }

    const { resultError } = useResultException();
    const router = useRouter();
    const route = useRoute();
    const { isRequired } = useValidationRules();

    const props = defineProps<IProps>();

    const formRef = ref(null);
    const localForm: Ref<PagesDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        name: '',
        description: '',
        slug: '',
        pagePath: '',
        type: null,
        seo: null,
    });

    const isOpenModalInfo: Ref<boolean> = ref(false);

    const onRedirectEdit = () => {
        router.push({
            name: RouterName.PagesEdit,
            params: { id: localForm.value.id },
        });
    };

    const onCreate = async () => {
        const result = await new PagesControllerClient(getApiClientInitialParams()).create(localForm.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            localForm.value = result.entity!;
            isOpenModalInfo.value = true;
        }
    };

    const onUpdate = async () => {
        const result = await new PagesControllerClient(getApiClientInitialParams()).update(localForm.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            const name = route.query.type === PagesType.Landing ? RouterName.PagesLanding : RouterName.PagesBlogs;
            router.push({ name });
        }
    };

    const onChange = () => {
        (formRef.value! as QForm).validate().then((success: boolean) => {
            if (success) {
                if (props.id) {
                    onUpdate();
                } else {
                    onCreate();
                }
            }
        });
    };

    onMounted(() => {
        nextTick(() => {
            if (props.id) {
                localForm.value = props.form!;
            }
        });
        if (route.name === RouterName.PagesCreate && route.query.type) {
            localForm.value.type = route.query.type as PagesDtoType;
        }
    });
</script>
<template>
    <q-card class="blogs-form-components section-create-form">
        <q-card-section>
            <q-form ref="formRef" class="blogs-form-components__form" @submit="onChange">
                <div class="section-create-form__field q-mb-md" v-if="!route.query.type">
                    <select-pages-type v-model="localForm.type" :multiple="false" :rules="[isRequired]" />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-input color="primary" v-model="localForm.name" label="Название" outlined lazy-rules :rules="[isRequired]" />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-input color="primary" v-model="localForm.slug" label="Символьный код" outlined lazy-rules :rules="[isRequired]" />
                </div>
                <div v-if="form?.type === PagesDtoType.Blog || route.query.type === PagesDtoType.Blog" class="section-create-form__field q-mb-lg">
                    <q-select
                        color="primary"
                        v-model="localForm.pagePath"
                        label="Шаблон страницы"
                        :options="templatePages"
                        option-label="name"
                        option-value="path"
                        map-options
                        outlined
                        clearable
                    />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <editor :model-value="localForm.description" @update="localForm.description = $event" />
                </div>
                <h4 class="text-h5 q-mb-lg">SEO парамметры</h4>
                <seo-params
                    :data="form?.seo?.params"
                    @on-change="localForm.seo = {
                        params: $event
                    }" />
            </q-form>
            <form-buttons @success="onChange" />
        </q-card-section>
    </q-card>
    <q-dialog v-model="isOpenModalInfo">
        <modals-info title="Внимание" text="Хотите продолжить редактирование и создасть статьи?" @on-success="onRedirectEdit" />
    </q-dialog>
</template>

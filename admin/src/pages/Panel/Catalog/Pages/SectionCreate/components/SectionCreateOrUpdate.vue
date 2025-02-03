<script lang="ts" setup>
    import { onMounted, Ref, ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import {
        CreateDropzoneDto,
        CreateSectionDto,
        getApiClientInitialParams,
        ResponseSectionDto,
        SectionControllerClient,
    } from 'src/ApiClient/ApiClient';
    import { RouterName } from 'src/router/routerName';
    import { useQuasar } from 'quasar';
    import FormButtons from '/src/components/UI/FormButtons.vue';
    import Dropzone from 'src/components/Dropzone/Dropzone.vue';

    const $q = useQuasar();
    const route = useRoute();
    const router = useRouter();

    // Ref на форму
    const formEdit = ref();
    let id: Ref<number | null> = ref(null);
    // Модель загрузки
    const isLoading = ref(true);
    // Модель раздела
    let form: Ref<CreateSectionDto> = ref({
        id: null,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        name: '',
        code: '',
        description: '',
        shortDescription: '',
        isTop: false,
        isActive: true,
        isRemove: false,
        imagePath: null,
        iconPath: null,
        seoTitle: '',
        seoDesctiption: '',
        seoKeywords: '',
        parent: null,
        childrens: null,
    });
    // Модель всех разделов
    let allSections: Ref<CreateSectionDto[]> = ref([]);
    const api = new SectionControllerClient(getApiClientInitialParams());
    // Сохранение раздела
    const saveForm = () => {
        formEdit.value!.validate().then(async (success: boolean) => {
            if (success) {
                const result = await api.create(form.value);
                if (!result.isSuccess) {
                    $q.notify({
                        color: 'negative',
                        textColor: 'white',
                        icon: 'warning',
                        message: 'Произошла ошибка',
                    });
                } else {
                    $q.notify({
                        color: 'positive',
                        textColor: 'white',
                        icon: 'check',
                        message: 'Раздел создан',
                    });

                    router.push({
                        name: RouterName.CatalogSection,
                    });
                }
            }
        });
    };
    const deleteItem = async () => {
        const result: ResponseSectionDto = await api.delete(id.value!.toString());
        if (result.isSuccess) {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Раздел удален',
            });
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        }
        router.push({ name: RouterName.CatalogSection });
    };

    const addImages = (event: CreateDropzoneDto) => {
        if (!form.value.imagePath) {
            form.value.imagePath = [];
        }
        form.value.imagePath.push(event);
    };
    const removeImages = (event: CreateDropzoneDto) => {
        const index = form.value.imagePath?.findIndex((el) => el.id === event.id);
        form.value.imagePath?.splice(index!, 1);
    };

    // Получение всех разделов
    const getAllSections = async () => {
        const result = await api.get();
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        } else {
            allSections!.value = result.entity!.filter((el: CreateSectionDto) => el.id !== id.value);
        }
    };
    // Получение раздела
    const getDetailInfo = async () => {
        const result: ResponseSectionDto = await api.getOne(id!.value!.toString());
        if (!result.isSuccess && !result.entity) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        } else {
            form.value = result.entity!;
        }
        isLoading.value = false;
    };
    onMounted(() => {
        if (route.name === RouterName.CatalogSectionEdit) {
            id.value = Number(route.params.id);
            getDetailInfo();
        } else {
            isLoading.value = false;
        }
        getAllSections();
    });
</script>

<template>
    <div>
        <div class="row items-center justify-center" v-if="isLoading">
            <q-spinner color="primary" size="4em" :thickness="3" />
        </div>
        <div class="section-create form-edit" v-else>
            <h4 class="text-h4 q-mb-lg">Основные настройки</h4>
            <q-card class="section-create-form">
                <q-card-section>
                    <q-form ref="formEdit">
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.name"
                                label="Название"
                                outlined
                                lazy-rules
                                :rules="[(val) => (val && val.length > 0) || 'Заполните поле']"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.code"
                                label="Символьный код"
                                outlined
                                lazy-rules
                                :rules="[(val) => (val && val.length > 0) || 'Заполните поле']"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="textarea"
                                v-model="form.description"
                                label="Описание"
                                outlined
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="textarea"
                                v-model="form.shortDescription"
                                label="Краткое описание"
                                outlined
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-select
                                v-model="form.parent"
                                :options="allSections"
                                option-label="name"
                                option-value="id"
                                color="secondary"
                                label="Родителький раздел"
                                outlined
                                clearable
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <Dropzone
                                id="sectionImages"
                                title="Загрузка картинки"
                                :files-props="form.imagePath || []"
                                @on-add-file="addImages"
                                @delete-file="removeImages"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <Dropzone id="sectionIcon" title="Загрузка иконки" :files-props="form.iconPath || []" />
                        </div>
                        <div class="section-create-form__field row q-gutter-md">
                            <q-toggle color="secondary" v-model="form.isTop" label="Главный раздел?" />
                            <q-toggle color="secondary" v-model="form.isActive" label="Активный?" />
                        </div>
                    </q-form>
                </q-card-section>
            </q-card>
            <h4 class="text-h4 q-mb-lg q-mt-lg">SEO настройки</h4>
            <q-card class="section-create-form q-mb-lg">
                <q-card-section>
                    <q-form>
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="secondary" v-model="form.seoTitle" label="Заголовок" outlined />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="secondary" v-model="form.seoDesctiption" label="Описание" outlined />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="textarea"
                                v-model="form.seoKeywords"
                                label="Ключевые слова"
                                outlined
                            />
                        </div>
                    </q-form>
                </q-card-section>
            </q-card>

            <q-btn color="negative full" @click="deleteItem" outline>Удалить раздел</q-btn>
        </div>
        <form-buttons @success="saveForm" />
    </div>
</template>

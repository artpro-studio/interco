<script lang="ts" setup>
    import { QForm } from 'quasar';
    import useResultException from 'src/helpers/useResultException';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { RouterName } from 'src/router/routerName';
    import { nextTick, onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import FormButtons from 'src/components/UI/FormButtons.vue';
    import { getApiClientInitialParams, SettingsMenuControllerClient, SettingsMenuDto } from '@/ApiClient/ApiClient';

    const { resultError } = useResultException();
    const router = useRouter();
    const route = useRoute();
    const { isRequired } = useValidationRules();

    const api = new SettingsMenuControllerClient(getApiClientInitialParams());
    const formRef = ref(null);
    const form: Ref<SettingsMenuDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        title: '',
        slug: '',
    });

    const onRedirect = () => {
        if (route.query.page) {
            router.push({
                name: RouterName.SettingsMenuEdit,
                params: { id: Number(route.query.page) },
            });
        } else {
            router.push({
                name: RouterName.SettingsMenu,
            });
        }
    };

    const onCreate = async () => {
        const result = await api.create(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity!;
            onRedirect();
        }
    };

    const onUpdate = async () => {
        const result = await api.update(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            onRedirect();
        }
    };

    const onChange = () => {
        (formRef.value! as QForm).validate().then((success: boolean) => {
            if (success) {
                if (route.name === RouterName.SettingsMenuEdit) {
                    onUpdate();
                } else {
                    onCreate();
                }
            }
        });
    };

    const getInfo = async () => {
        const result = await api.getOne(Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity!;
        }
    };

    onMounted(() => {
        nextTick(() => {
            if (route.name === RouterName.SettingsMenuEdit) {
                getInfo();
            }
        });
    });
</script>
<template>
    <q-card class="blogs-form-components section-create-form">
        <q-card-section>
            <q-form ref="formRef" class="blogs-form-components__form" @submit="onChange">
                <div class="section-create-form__field q-mb-md" v-if="!route.query.page">
                    <selects-pages v-model="form.pages" :multiple="false" />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-input
                        color="primary"
                        v-model="form.title"
                        label="Название"
                        outlined
                        lazy-rules
                        :rules="[isRequired]"
                    />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-input
                        color="primary"
                        v-model="form.slug"
                        label="Символьный код"
                        outlined
                        lazy-rules
                        :rules="[isRequired]"
                    />
                </div>
            </q-form>
            <form-buttons @success="onChange" />
        </q-card-section>
    </q-card>
</template>

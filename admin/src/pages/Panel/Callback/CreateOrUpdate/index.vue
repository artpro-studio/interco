<script lang="ts" setup>
    import { QForm } from 'quasar';
    import useResultException from 'src/helpers/useResultException';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { RouterName } from 'src/router/routerName';
    import { nextTick, onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import FormButtons from 'src/components/UI/FormButtons.vue';
    import FieldIndex from './components/FieldIndex/FieldIndex.vue';
    import { CallbackControllerClient, CallbackDto, getApiClientInitialParams } from '@/ApiClient/ApiClient';

    const { resultError } = useResultException();
    const router = useRouter();
    const route = useRoute();
    const { isRequired } = useValidationRules();

    const api = new CallbackControllerClient(getApiClientInitialParams());
    const formRef = ref(null);
    const form: Ref<CallbackDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        name: '',
        slug: '',
        syncBitrix: false,
        syncAmo: false,
    });
    const tab = ref('settings');

    const onRedirect = (id: number | null = null) => {
        if (route.name === RouterName.ReferenceBookCreate) {
            router.push({
                name: RouterName.CallbackEdit,
                params: { id },
            });
        } else {
            router.push({
                name: RouterName.Callback,
            });
        }
    };

    const onCreate = async () => {
        const result = await api.create(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity!;
            onRedirect(result.entity?.id);
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
                if (route.name === RouterName.ReferenceBookEdit) {
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
            if (route.name === RouterName.CallbackEdit) {
                getInfo();
            }
        });
    });
</script>
<template>
    <q-tabs v-model="tab" color="primary" active-color="primary" dense swipeable inline-label>
        <q-tab name="settings" icon="settings" label="Основные настройки" />
        <q-tab v-if="route.name === RouterName.CallbackEdit" name="attributes" icon="edit_attributes" label="Поля" />
    </q-tabs>
    <q-tab-panels v-model="tab">
        <q-tab-panel name="settings">
            <q-card class="blogs-form-components section-create-form">
                <q-card-section>
                    <q-form ref="formRef" class="blogs-form-components__form" @submit="onChange">
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="primary" v-model="form.name" label="Название" outlined lazy-rules :rules="[isRequired]" />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="primary" v-model="form.slug" label="Символьный код" outlined lazy-rules :rules="[isRequired]" />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="primary" v-model="form.email" label="Email(Куда отправлять)" outlined />
                        </div>
                        <div class="section-create-form__field row q-gutter-md q-mb-md">
                            <q-checkbox v-model="form.syncBitrix" label="Синх. битрикс" />
                            <q-checkbox v-model="form.syncAmo" label="Синх. AmoCRM" />
                        </div>
                    </q-form>
                    <form-buttons @success="onChange" />
                </q-card-section>
            </q-card>
        </q-tab-panel>
        <q-tab-panel name="attributes">
            <field-index />
        </q-tab-panel>
    </q-tab-panels>
</template>

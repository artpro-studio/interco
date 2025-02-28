<script lang="ts" setup>
    import { FullSettingsDto, getApiClientInitialParams, SettingsControllerClient } from 'src/ApiClient/ApiClient';
    import { onMounted, ref, Ref } from 'vue';
    import FormButtons from 'src/components/UI/FormButtons.vue';
    import useResultException from 'src/helpers/useResultException';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { QForm, useQuasar } from 'quasar';
    import SettingsContent from './components/SettingsContent.vue';
    import AmoCrmCustomFeldsList from './components/amoCrmCustomFelds/AmoCrmCustomFeldsList.vue';

    const { resultError } = useResultException();
    const { isRequired, isRequiredEmail } = useValidationRules();
    const $q = useQuasar();

    const isLoading: Ref<boolean> = ref(true);
    const formRef = ref(null);
    const form: Ref<FullSettingsDto | null> = ref(null);
    const tab = ref('settings');

    const onUpdatePhone = (event: any) => {
        form.value!.morePhone = event;
    };

    const onUpdateEmail = (event: any) => {
        form.value!.moreEmail = event;
    };

    const onSave = () => {
        (formRef.value! as QForm).validate().then(async (success: boolean) => {
            if (success) {
                const result = await new SettingsControllerClient(getApiClientInitialParams()).update(form.value!);
                if (!result.isSuccess) {
                    resultError(result, null);
                } else {
                    $q.notify({
                        color: 'positive',
                        textColor: 'white',
                        icon: 'check',
                        message: 'Настройки сохранены',
                    });
                }
            }
        });
    };

    const getInfo = async () => {
        const result = await new SettingsControllerClient(getApiClientInitialParams()).get();
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            isLoading.value = false;
            form.value = result.entity;
        }
    };

    onMounted(() => {
        getInfo();
    });
</script>

<template>
    <div class="container container-form">
        <div class="row items-center justify-center" v-if="isLoading">
            <q-spinner color="primary" size="4em" :thickness="3" />
        </div>
        <div class="section-create form-edit" v-else>
            <q-tabs v-model="tab" class="text-primary" inline-label>
                <q-tab name="settings" icon="settings" label="Основные настройки" />
                <q-tab name="callback" icon="phone_callback" label="Обратная связь" />
            </q-tabs>
            <q-card class="section-create-form q-mb-lg">
                <q-card-section>
                    <q-form ref="formRef" @submit="onSave">
                        <q-tab-panels v-model="tab">
                            <q-tab-panel name="settings">
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.title" label="Название" outlined lazy-rules :rules="[isRequired]" />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.description" label="Описание" outlined lazy-rules :rules="[isRequired]" />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input
                                        color="primary"
                                        v-model="form!.phone"
                                        label="Телефон"
                                        mask="+7 (###) ### - ## ##"
                                        outlined
                                        lazy-rules
                                        :rules="[isRequired]"
                                    />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.email" label="E-mail" outlined lazy-rules :rules="[isRequiredEmail]" />
                                </div>
                                <div class="section-create-form__field q-mb-lg">
                                    <settings-content :value="form!.moreEmail" :is-phone="false" label="E-mails" @update:model-value="onUpdateEmail" />
                                </div>
                                <div class="section-create-form__field q-mb-lg">
                                    <settings-content :value="form!.morePhone" :is-phone="true" label="Телефоны" @update:model-value="onUpdatePhone" />
                                </div>
                                <h4 class="text-h5 q-mb-lg">Социальные сети</h4>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.telegram" label="Телеграмм" outlined />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.viber" label="Viber" outlined />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.whatsapp" label="Whatsapp" outlined />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.vk" label="VK" outlined />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.facebook" label="Facebook" outlined />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.linkedIn" label="LinkedIn" outlined />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.discord" label="Discord" outlined />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.instagram" label="Instagram" outlined />
                                </div>
                            </q-tab-panel>
                            <q-tab-panel name="callback">
                                <h4 class="text-h5 q-mb-lg">Битрикс 24</h4>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.urlBitrix" label="Ссылка на Bitrix" outlined/>
                                </div>
                                <h4 class="text-h5 q-mb-lg">AmoCRM</h4>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.amoDomain" label="Домен" outlined />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.amoClientId" label="Клиент id" outlined  />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.amoClientSecret" label="Секретный ключ" outlined  />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input color="primary" v-model="form!.amoBearer" label="Токен" outlined />
                                </div>
                                <h6 class="text-h6 text-normal q-mb-lg">Кастомные поля</h6>
                                <amo-crm-custom-felds-list />
                            </q-tab-panel>
                        </q-tab-panels>
                    </q-form>
                </q-card-section>
            </q-card>
            <form-buttons @success="onSave" :hidden-close="true" />
        </div>
    </div>
</template>

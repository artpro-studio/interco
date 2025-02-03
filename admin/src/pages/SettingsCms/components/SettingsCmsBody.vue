<script lang="ts" setup>
    import { useQuasar } from 'quasar';
    import { ref, Ref } from 'vue';
    import {
        CreateSettingsDto,
        getApiClientInitialParams,
        SettingsControllerClient,
        UserDtoRole,
    } from '../../../ApiClient/ApiClient';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { useRouter } from 'vue-router';

    const $q = useQuasar();
    const { isRequired } = useValidationRules();
    const router = useRouter();

    const form: Ref<CreateSettingsDto> = ref({
        settings: {
            id: null,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
            deletedAt: null,
            title: '',
            description: '',
            vk: '',
            telegram: '',
            whatsapp: '',
            viber: '',
            facebook: '',
            email: null,
            phone: null,
        },
        user: {
            id: null,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
            deletedAt: null,
            isActive: true,
            lastName: '',
            firstName: '',
            middleName: '',
            email: '',
            password: '',
            role: UserDtoRole.Admin,
        },
    });
    const tab: Ref<string> = ref('settings');

    const saveSettings = async () => {
        const result = await new SettingsControllerClient(getApiClientInitialParams()).create(form.value);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Сохранено успешно',
            });
            router.push('/');
        }
    };
</script>
<template>
    <section class="settings-cms">
        <div class="settings-cms__head">
            <div class="settings-cms__head_body">
                <div class="main-container">
                    <div class="settings-cms__head__text">
                        <h1>Добро пожаловать</h1>
                        <p>Заполните первочнальные настройки</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="settings-cms__form">
            <q-card>
                <q-tabs v-model="tab" color="primary" align="justify" :breakpoint="0" class="q-mb-md q-pa-md" dense>
                    <q-tab name="settings" icon="mail" label="Настройки сайта" />
                    <q-tab name="user" icon="alarm" label="Пользователь" />
                </q-tabs>
                <q-form @submit="saveSettings">
                    <q-tab-panels v-model="tab" animated swipeable transition-prev="jump-up" transition-next="jump-up">
                        <q-tab-panel name="settings">
                            <div class="settings-cms__form__col">
                                <div class="q-mb-md">
                                    <q-input
                                        v-model="form.settings.title"
                                        color="primary"
                                        label="Заголовок"
                                        :rules="[isRequired]"
                                        outlined
                                    />
                                </div>
                                <div class="q-mb-md">
                                    <q-input
                                        v-model="form.settings.description"
                                        color="primary"
                                        label="Описание"
                                        :rules="[isRequired]"
                                        outlined
                                    />
                                </div>
                            </div>
                        </q-tab-panel>
                        <q-tab-panel name="user">
                            <div class="settings-cms__form__col">
                                <div class="q-mb-md">
                                    <q-input
                                        v-model="form.user.email"
                                        color="primary"
                                        label="Email"
                                        :rules="[isRequired]"
                                        outlined
                                    />
                                </div>
                                <div class="q-mb-md">
                                    <q-input
                                        v-model="form.user.password"
                                        color="primary"
                                        label="Пароль"
                                        :rules="[isRequired]"
                                        outlined
                                    />
                                </div>
                                <div class="q-mb-md">
                                    <q-input
                                        v-model="form.user.firstName"
                                        color="primary"
                                        label="Имя"
                                        :rules="[isRequired]"
                                        outlined
                                    />
                                </div>
                                <div class="q-mb-md">
                                    <q-input
                                        v-model="form.user.lastName"
                                        color="primary"
                                        label="Фамилия"
                                        :rules="[isRequired]"
                                        outlined
                                    />
                                </div>
                                <div class="q-mb-md">
                                    <q-input
                                        v-model="form.user.middleName"
                                        color="primary"
                                        label="Отчество"
                                        :rules="[isRequired]"
                                        outlined
                                    />
                                </div>
                            </div>
                        </q-tab-panel>
                    </q-tab-panels>
                    <div class="q-mb-md q-pa-md">
                        <q-btn type="submit" class="full gradient-black">Сохранить</q-btn>
                    </div>
                </q-form>
            </q-card>
        </div>
    </section>
</template>
<style lang="scss" scoped>
    .settings-cms {
        padding: 15px;

        &__head {
            height: 470px;
            background-image: url('/public/images/login.jpeg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            border-radius: 12px;
            position: relative;
            overflow: hidden;

            &:before {
                content: '';
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                background-image: linear-gradient(310deg, #141727, #3a416f);
                opacity: 0.6;
            }

            &__text {
                text-align: center;
                position: relative;
                padding-top: 100px;

                h1 {
                    font-weight: bold;
                    color: #fff;
                    font-size: 2.4em;
                    margin-bottom: 10px;
                }

                p {
                    color: #fff;
                }
            }
        }

        &__form {
            margin: 0 auto;
            margin-top: -150px;
            max-width: 800px;
            width: 600px;
        }
    }
</style>

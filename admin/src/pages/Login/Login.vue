<!-- filename: LoginPage.vue -->
<script lang="ts" setup>
    import { FullUsersDto, LoginDto } from 'app/ApiClient/ApiClient';
    import { QForm } from 'quasar';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { RouterName } from 'src/router/routerName';
    import { useStore } from 'src/store';
    import { computed, ref, Ref } from 'vue';
    import { useRouter } from 'vue-router';

    const store = useStore();
    const router = useRouter();
    const { isRequired, isRequiredEmail } = useValidationRules();

    const formRef = ref(null);
    const form: Ref<LoginDto> = ref({
        email: '',
        password: '',
    });

    const currentUser = computed((): FullUsersDto | null => {
        return store.getters['accountModule/accountInfo'];
    });

    const routerPanel = computed((): string => {
        const path = router.resolve({
            name: RouterName.Panel,
        });

        return path.fullPath;
    });

    const auth = async () => {
        (formRef.value! as QForm).validate().then(async (success: boolean) => {
            if (success) {
                const user: FullUsersDto | null = await store.dispatch('authorizationModule/login', form.value);
                if (user) {
                    store.commit('accountModule/setAccountInfo', user);
                    router.push({
                        name: RouterName.Panel,
                    });
                }
            }
        });
    };
</script>
<template>
    <section class="login">
        <div class="login__head">
            <div class="login__head_body">
                <div class="main-container">
                    <div class="login__head__text">
                        <h1>Добро пожаловать</h1>
                        <p>Войдите в свою учетную запись, чтобы упралять системой сайта</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="login__form">
            <q-card>
                <q-card-section v-if="currentUser">
                    <div class="login__form__header text-center" :class="{ 'q-mb-lg': !currentUser }">
                        <h4 class="text-h5 text-dark q-mb-md">Вы уже авторизированы</h4>
                        <div class="login__user q-md-md">
                            <div class="login__user__body row">
                                <div class="login__user__images">
                                    <q-avatar class="q-mr-md">
                                        <img src="/images/emoji/user.svg" />
                                    </q-avatar>
                                </div>
                                <div class="login__user__info">
                                    <div class="login__user__email">{{ currentUser.email }}</div>
                                    <div class="login__user__name">{{ currentUser.lastName }} {{ currentUser.firstName }}</div>
                                </div>
                            </div>
                        </div>
                        <div class="q-mt-md">
                            <q-btn color="primary" :to="routerPanel" class="full">Войти</q-btn>
                        </div>
                    </div>
                </q-card-section>
                <q-card-section v-else>
                    <div class="login__form__header text-center q-mb-lg">
                        <h4 class="text-h5 text-dark">Авторизация</h4>
                    </div>
                    <q-form ref="formRef" @submit="auth">
                        <div class="q-mb-sm">
                            <q-input v-model="form.email" color="primary" label="Email" :rules="[isRequiredEmail]" outlined />
                        </div>
                        <div class="q-mb-md">
                            <q-input type="password" v-model="form.password" color="primary" label="Пароль" :rules="[isRequired]" outlined />
                        </div>
                        <div class="q-mb-md">
                            <q-btn color="primary" type="submit" class="full">Войти</q-btn>
                        </div>
                        <div class="login__form__link q-mt-md">
                            <a href="" class="text-dark">Восстановить пароль</a>
                        </div>
                    </q-form>
                </q-card-section>
            </q-card>
        </div>
    </section>
</template>
<style lang="scss" scoped>
    .login {
        padding: 15px;

        &__user {
            &__info {
                text-align: left;
            }
        }

        &__head {
            height: 470px;
            background-image: url('/images/login2.png');
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
            max-width: 430px;
            margin: 0 auto;
            margin-top: -150px;

            h4 {
                font-weight: bold;
            }

            &__link {
                text-align: center;

                a {
                    text-decoration: none;
                }
            }
        }

        @media (max-width: 996px) {
            padding: 10px;
        }

        @media (max-width: 650px) {
            &__head {
                &__text {
                    h1 {
                        font-size: 1.8em;
                    }
                }
            }

            &__form {
                max-width: 320px;
                margin-top: -200px;
            }
        }
    }
</style>

<script lang="ts" setup>
    import { computed, createApp, onMounted, Ref, ref } from 'vue';
    import ModalsInfo from 'src/components/Modals/ModalsInfo.vue';
    import FormButtons from '../../../../../components/UI/FormButtons.vue';
    import { useRoute, useRouter } from 'vue-router';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { UserDto, getApiClientInitialParams, UserControllerClient, ResultDto, Role, ResultUserDto } from 'src/ApiClient/ApiClient';
    import { RouterName } from 'src/router/routerName';
    import { UserRoles, IUserRoles } from '../interface';
    import { useQuasar } from 'quasar';

    const app = createApp({});
    app.component('FormButtons', FormButtons).component('ModalInfo', ModalsInfo);

    const $q = useQuasar();
    const route = useRoute();
    const router = useRouter();

    const { isRequiredIf, isRequired, isRequiredEmail } = useValidationRules();

    let id: Ref<number | null> = ref(null);
    // Ref на форму
    const formEdit = ref();
    // Модель загрузки
    const isLoading = ref(true);
    // Модель раздела
    let form: Ref<UserDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        email: '',
        password: '',
        firstName: '',
        lastName: '',
        middleName: '',
        isActive: true,
        role: Role.Guest,
    });
    // Поле для подтверждения пароля
    const confirmPassword: Ref<string> = ref('');
    // Сущность для модального окна удаление
    const isDelete: Ref<boolean> = ref(false);
    // Список ролей
    const userRoles: Ref<IUserRoles[]> = ref(UserRoles);

    const api = computed((): UserControllerClient => {
        return new UserControllerClient(getApiClientInitialParams());
    });

    const updateData = async () => {
        console.log('asdasd');
        const result: ResultUserDto = await api.value.update(form.value);
        console.log(result);
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

            router.push({
                name: RouterName.Users,
            });
        }
    };

    const createData = async () => {
        const result: ResultUserDto = await api.value.create(form.value);

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

            router.push({
                name: RouterName.Users,
            });
        }
    };

    // Сохранение раздела
    const saveForm = () => {
        formEdit.value!.validate().then(async (success: boolean) => {
            if (success) {
                if ((form.value.password || confirmPassword.value) && form.value.password !== confirmPassword.value) {
                    $q.notify({
                        color: 'negative',
                        textColor: 'white',
                        icon: 'warning',
                        message: 'Пароли не совпадают',
                    });
                    return;
                }
                if (route.name === RouterName.UsersEdit) {
                    updateData();
                } else {
                    createData();
                }
            }
        });
    };

    const deleteItem = async () => {
        isDelete.value = false;

        const result: ResultDto = await api.value.delete(id.value!);
        if (result.isSuccess) {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Пользователь удален',
            });
            router.push({ name: RouterName.Users });
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        }
    };

    // Получение раздела
    const getDetailInfo = async () => {
        console.log('id.value', id.value);
        const result: ResultUserDto = await api.value.getOne(Number(id.value));
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
    };

    onMounted(() => {
        isLoading.value = false;
        if (route.name === RouterName.UsersEdit) {
            id.value = Number(route.params.id);
            getDetailInfo();
        }
    });
</script>

<template>
    <div>
        <div class="row items-center justify-center" v-if="isLoading">
            <q-spinner color="primary" size="4em" :thickness="3" />
        </div>
        <div class="section-create form-edit" v-else>
            <q-card class="section-create-form q-mb-lg">
                <q-card-section>
                    <q-form @submit="saveForm" ref="formEdit">
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="primary" v-model="form.email" label="E-mail" outlined lazy-rules :rules="[isRequiredEmail]" />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="primary"
                                v-model="form.password"
                                label="Пароль"
                                outlined
                                lazy-rules
                                :rules="[isRequiredIf(() => route.name !== RouterName.UsersEdit)]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="primary"
                                v-model="confirmPassword"
                                label="Поворите пароль"
                                outlined
                                lazy-rules
                                :rules="[isRequiredIf(() => route.name !== RouterName.UsersEdit)]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="primary" v-model="form.firstName" label="Имя" outlined lazy-rules />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="primary" v-model="form.lastName" label="Фамилия" outlined lazy-rules :rules="[isRequired]" />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input color="primary" v-model="form.middleName" label="Отчество" outlined lazy-rules :rules="[isRequired]" />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-select
                                outlined
                                v-model="form.role"
                                :options="userRoles"
                                option-value="value"
                                option-label="text"
                                label="Роль пользователя"
                                emit-value
                                map-options
                            />
                        </div>
                    </q-form>
                </q-card-section>
            </q-card>

            <q-btn color="negative full" @click="isDelete = true" outline flat>Удалить пользователя</q-btn>
        </div>
        <form-buttons @success="saveForm" />

        <q-dialog v-model="isDelete">
            <modals-info text="Подтвердите ваше действие" @success="deleteItem" />
        </q-dialog>
    </div>
</template>

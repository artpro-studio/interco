<script setup lang="ts">
    import { SendsSubscriptionControllerClient } from '@/ApiClient/ApiClient';
    import { getApiClientInitialParams } from '@/ApiClient/ApiClient';
    import { ILangSubscription, SendsSubscriptionDto } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import useValidationRules from '@/helpers/useValidationRules';
    import { QForm, useQuasar } from 'quasar';
    import { onMounted } from 'vue';
    import { ref } from 'vue';

    interface IProps {
        id?: number | null;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close']);

    const $q = useQuasar();
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { isRequired } = useValidationRules();
    const { resultError } = useResultException();

    const api = new SendsSubscriptionControllerClient(getApiClientInitialParams());
    const isLoading = ref(true);
    const formRef = ref<QForm | null>(null);
    const form = ref<SendsSubscriptionDto>({
        title: [
            {
                lang: ILangSubscription.RuRU,
                value: '',
            },
            {
                lang: ILangSubscription.EnUS,
                value: '',
            },
            {
                lang: ILangSubscription.ZhCN,
                value: '',
            },
        ],
        description: [
            {
                lang: ILangSubscription.RuRU,
                value: '',
            },
            {
                lang: ILangSubscription.EnUS,
                value: '',
            },
            {
                lang: ILangSubscription.ZhCN,
                value: '',
            },
        ],
    });

    const onChange = () => {
        (formRef.value! as QForm).validate().then(async (success: boolean) => {
            if (success) {
                const result = await api.create(form.value);
                if (!result.isSuccess) {
                    resultError(result, null);
                } else {
                    emit('on-close');
                    $q.notify({
                        color: 'positive',
                        textColor: 'white',
                        icon: 'check',
                        message: 'Рассылка создана',
                    });
                }
            }
        });
    };

    const getInfo = async () => {
        const result = await api.getOne(props.id!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity!;
            isLoading.value = false;
        }
    };

    onMounted(() => {
        if (props.id) {
            getInfo();
        } else {
            isLoading.value = false;
        }
    });
</script>

<template>
    <div class="q-pa-md flex flex-center" v-if="isLoading">
        <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
    </div>
    <q-card class="create-update-pages-params" v-else>
        <q-card-section>
            <q-btn icon="close" class="create-update-pages-params__close" @click="emit('on-close')" round></q-btn>
            <div class="create-update-pages-params__header q-mb-lg">
                <h4 class="text-h4">{{ props.id ? 'Информация' : 'Создание' }}</h4>
            </div>
            <q-form ref="formRef" @submit="onChange">
                <div class="text-h5 q-mb-md">Заголвоок</div>
                <div class="section-create-form__field__body row no-wrap q-gutter-md">
                    <div v-for="(item, key) in form.title" :key="key" class="section-create-form__field q-mb-lg">
                        <q-input v-model="item.value" :label="item.lang" :rules="[isRequired]" outlined :disable="!!props.id" />
                    </div>
                </div>
                <div class="section-create-form__field__body">
                    <div class="text-h5 q-mb-md">Описание</div>
                    <div v-for="(item, key) in form.description" :key="key" class="section-create-form__field q-mb-lg">
                        <div class="text-h6 q-mb-md">{{ item.lang }}</div>
                        <q-field class="section-create-form__q-field" v-model="item.value" :rules="[isRequired]">
                            <q-editor
                                type="textarea"
                                v-model="item.value"
                                :label="item.lang?.toString()"
                                class="full"
                                :disable="!!props.id"
                                :toolbar="[
                                    ['bold', 'italic', 'underline'],
                                    ['unordered', 'ordered'],
                                    [
                                        {
                                            label: $q.lang.editor.formatting,
                                            icon: $q.iconSet.editor.formatting,
                                            list: 'no-icons',
                                            options: ['p', 'code'],
                                        },
                                    ],
                                ]"
                                outlined
                            />
                        </q-field>
                    </div>
                </div>
                <div v-if="!props.id" class="create-update-pages-params__buttons">
                    <q-btn type="submit" color="primary" class="full">{{ props.id ? 'Сохранить' : 'Создать' }}</q-btn>
                </div>
            </q-form>
        </q-card-section>
    </q-card>
</template>
<style lang="scss">
    .section-create-form {
        &__q-field {
            .q-field__control {
                color: var(--dark-blue);
            }
        }
    }
</style>
<style lang="scss" scoped>
    .create-update-pages-params {
        min-width: 700px;

        @media (max-width: 700px) {
            min-width: auto;
            width: 100%;
        }

        &__close {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    }
</style>

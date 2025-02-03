<script lang="ts" setup>
    import { AmoCustmoFieldsDto, AmoCustomFieldsControllerClient, getApiClientInitialParams, ICallbackFiledAttribute } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import useValidationRules from '@/helpers/useValidationRules';
    import { CallbackFieldOptions } from '@/pages/Panel/Callback/CreateOrUpdate/components/FieldIndex/interface';
    import { QForm, useQuasar } from 'quasar';
    import { computed, onMounted, ref } from 'vue';

    interface IProps {
        id?: number | null;
        selectListAttribute: ICallbackFiledAttribute[];
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close']);

    const $q = useQuasar();
    const { resultError } = useResultException();
    const { isRequired } = useValidationRules();

    const api = new AmoCustomFieldsControllerClient(getApiClientInitialParams());
    const isLoading = ref(true);
    const formRef = ref<QForm | null>(null);
    const form = ref<AmoCustmoFieldsDto>({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        amoID: 0,
        attribute: ICallbackFiledAttribute.Title,
    });
    const options = CallbackFieldOptions;

    const getOptionAttribute = computed(() => {
        return options.filter((el) => !props.selectListAttribute.includes(el.value) || el.value === form.value.attribute);
    });

    const onCreate = async () => {
        const result = await api.create(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            emit('on-close');
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Поле создано',
            });
        }
    };

    const onUpdate = async () => {
        const result = await api.update(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            emit('on-close');
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Поле изменено',
            });
        }
    };

    const onChange = () => {
        formRef.value?.validate().then((success: boolean) => {
            if (success) {
                if (props.id) {
                    onUpdate();
                } else {
                    onCreate();
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
        }
        isLoading.value = false;
    };

    onMounted(() => {
        if (props.id) {
            getInfo();
        } else {
            isLoading.value = false;
        }
        form.value.attribute = getOptionAttribute.value[0].value;
    });
</script>

<template>
    <q-card class="create-or-update-amo-custom">
        <q-btn icon="close" class="create-or-update-amo-custom__close" @click="emit('on-close')"></q-btn>

        <q-card-section>
            <div class="q-pa-md flex flex-center" v-if="isLoading">
                <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
            </div>
            <q-form v-else ref="formRef" @submit="onChange">
                <h4 class="text-h4 q-mb-lg">{{ props.id ? 'Измение' : 'Создание' }} поля</h4>
                <div class="section-create-form__field q-mb-md">
                    <q-input v-model="form.amoID" label="AmoCrm ID" :rulse="[isRequired]" outlined />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-select
                        v-model="form.attribute"
                        :options="getOptionAttribute"
                        label="Атрибут"
                        :rules="[isRequired]"
                        option-label="name"
                        option-value="value"
                        emit-value
                        map-options
                        outlined
                        lazy-rules
                        clearable
                    />
                </div>
                <div class="section-create-form__buttons">
                    <q-btn type="submit" color="primary" class="full">{{ props.id ? 'Изменить' : 'Создать' }}</q-btn>
                </div>
            </q-form>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .create-or-update-amo-custom {
        min-width: 320px;

        &__close {
            position: absolute;
            top: 0;
            right: 0;
            z-index: 2;
        }
    }
</style>

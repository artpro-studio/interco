<script lang="ts" setup>
    import { QForm } from 'quasar';
    import useResultException from 'src/helpers/useResultException';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { RouterName } from 'src/router/routerName';
    import { onMounted, ref, Ref } from 'vue';
    import { useRoute } from 'vue-router';
    import { CallbackFieldControllerClient, CreateCallbackFieldDto, getApiClientInitialParams, ICallbackFieldType, ICallbackFiledAttribute } from '@/ApiClient/ApiClient';
    import { CallbackFieldOptions, CallbackFieldTypeOptions } from '../FieldIndex/interface';

    interface IProps {
        callbackId: number;
        id?: number;
    }

    const emit = defineEmits(['on-close']);
    const props = defineProps<IProps>();
    const { resultError } = useResultException();
    const route = useRoute();
    const { isRequired } = useValidationRules();

    const api = new CallbackFieldControllerClient(getApiClientInitialParams());
    const formRef = ref(null);
    const form: Ref<CreateCallbackFieldDto> = ref({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
        name: '',
        type: ICallbackFieldType.String,
        attribute: ICallbackFiledAttribute.Title,
        isRequred: false,
        callbackId: props.callbackId,
    });
    const options = CallbackFieldOptions;
    const optionsType = CallbackFieldTypeOptions;

    const onCreate = async () => {
        const result = await api.create(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value.name = result.entity?.name || '';
            form.value.name = result.entity?.type || '';
            emit('on-close');
        }
    };

    const onUpdate = async () => {
        const result = await api.update(form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            emit('on-close');
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
        const result = await api.getOne(props.id!);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = {
                ...(result.entity as CreateCallbackFieldDto),
                callbackId: props.callbackId,
            };
        }
    };

    onMounted(() => {
        if (props.id) {
            getInfo();
        }
    });
</script>
<template>
    <q-card class="attribute-form-components">
        <q-btn icon="close" class="attribute-form-components__close" round @click="emit('on-close')" />
        <q-card-section>
            <div class="attribute-form-components__header q-mb-lg">
                <div class="attribute-form-components__header__title h2 text-bold">{{ props.id ? 'Изменение' : 'Создание' }} поля</div>
            </div>
            <q-form ref="formRef" class="attribute-form-components__form" @submit="onChange">
                <div class="section-create-form__field q-mb-md">
                    <q-input color="primary" v-model="form.name" label="Название" outlined lazy-rules :rules="[isRequired]" />
                </div>
                <div class="section-create-form__field q-mb-md">
                    <q-select
                        v-model="form.type"
                        :options="optionsType"
                        label="Тип поля"
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
                <div class="section-create-form__field">
                    <q-select
                        v-model="form.attribute"
                        :options="options"
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
                <div class="section-create-form__field q-mb-lg">
                    <q-checkbox v-model="form.isRequred" label="Обьязательное поле" />
                </div>
                <q-btn type="submit" color="primary" class="full">{{ props.id ? 'Изменить' : 'Создать' }}</q-btn>
            </q-form>
        </q-card-section>
    </q-card>
</template>
<style lang="scss">
    .attribute-form-components {
        min-width: 500px;
        position: relative;

        @media (max-width: 500px) {
            min-width: auto;
            width: 100%;
        }

        &__close {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 2;
        }
    }
</style>

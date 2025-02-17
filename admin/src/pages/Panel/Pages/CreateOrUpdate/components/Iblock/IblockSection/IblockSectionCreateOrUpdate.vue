<script lang="ts" setup>
    import { ILangPages, PagesIblockSectionDto } from '@/ApiClient/ApiClient';
    import useValidationRules from '@/helpers/useValidationRules';
    import { QForm } from 'quasar';
    import { onMounted, ref } from 'vue';

    interface IProps {
        data?: PagesIblockSectionDto;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close', 'on-change']);

    const { isRequired } = useValidationRules();

    const formRef = ref(null);
    const form = ref<PagesIblockSectionDto>({
        value: [
            {
                lang: ILangPages.RuRU,
                value: '',
            },
            {
                lang: ILangPages.EnUS,
                value: '',
            },
            {
                lang: ILangPages.ZhCN,
                value: '',
            },
        ]
    });

    const onUpdate = () => {
        (formRef.value! as QForm).validate().then((success) => {
            if (success) {
                emit('on-change', form.value);
            }
        });
    };

    onMounted(() => {
        form.value = {
            ...form.value,
            ...props.data,
        };
    });
</script>

<template>
    <q-card class="iblock-section-create-or-update">
        <q-card-section>
            <q-btn icon="close" class="iblock-section-create-or-update__close" @click="emit('on-close')" round></q-btn>
            <div class="create-update-pages-params__header q-mb-lg">
                <h4 class="text-h4">{{ data ? 'Редактирование' : 'Создание' }}</h4>
            </div>
            <q-form ref="formRef" @submit="onUpdate">
                <div class="iblock-section-create-or-update__body row no-wrap q-gutter-md">
                    <q-input
                        v-for="(el, index) in form.value"
                        :key="index"
                        v-model="form.value![index].value"
                        class="iblock-section-create-or-update__field"
                        :label="el.lang?.toString()"
                        :rules="[isRequired]"
                        outlined
                    />
                </div>
                <div>
                    <q-btn type="submit" color="primary" class="full">Сохранить</q-btn>
                </div>
            </q-form>

        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .iblock-section-create-or-update {
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

        &__body {
            @media (max-width: 700px) {
                flex-wrap: wrap;
            }
        }

        &__field {
            width: 33.333%;
            @media (max-width: 700px) {
                width: 100%;
            }
        }
    }
</style>

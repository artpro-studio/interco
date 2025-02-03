<script lang="ts" setup>
    import {onMounted, PropType, ref, Ref} from 'vue';
    import {
        ProdcutPropertyesOptionsDto,
        CreateProductPropertyesDto, getApiClientInitialParams,
        PropertyControllerClient, Result
    } from 'src/ApiClient/ApiClient';
    import {useQuasar} from 'quasar';

    const $q = useQuasar();
    const emit = defineEmits(['change']);
    const props: {
        form: CreateProductPropertyesDto,
    } = defineProps({
        form: {
            required: true,
            type: Object as PropType<CreateProductPropertyesDto>,
        },
    });

    const options: Ref<ProdcutPropertyesOptionsDto[]> = ref([]);
    const nullOptions: ProdcutPropertyesOptionsDto = {
        id: null,
        code: '',
        valueKey: '',
        value: ''
    };

    const changeOptions = (event: ProdcutPropertyesOptionsDto) => {
        if (event.code && event.value) {
            options.value.push({...nullOptions});
        }

        const filters: ProdcutPropertyesOptionsDto[] = options.value.filter((el: ProdcutPropertyesOptionsDto) => el.code && el.value);
        emit('change', filters);
    };


    const deleteItem = async (index: number) => {
        const id: number = options.value[index].id!;
        const result: Result = await new PropertyControllerClient(getApiClientInitialParams()).deleteOptions(id.toString());
        if (result.isSuccess) {
            options.value.splice(index, 1);
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        }
    };

    onMounted(() => {
        if (props.form.options?.length) {
            options.value = props.form.options;
        }
        options.value.push({...nullOptions});
    });
</script>
<template>
    <div>
        <div
            class="section-create-form__field row items-center q-gutter-md no-wrap q-mb-md"
            v-for="(item, index) in options"
            :key="index"
        >
            <q-input
                class="section-create-form__field__input"
                v-model="item.code"
                color="secondary"
                label="Символьный код"
                @change="changeOptions(item)"
                outlined
            />
            <q-input
                class="section-create-form__field__input"
                v-model="item.value"
                color="secondary"
                label="Название"
                @change="changeOptions(item)"
                outlined
            />
            <q-icon name="delete" size="24px" class="cursor-pointer" v-if="item.id" @click="deleteItem(index)" />
        </div>
    </div>
</template>
<style lang="scss" scoped>
    .section-create-form__field {
        &__input {
            width: 100%;
        }
    }
</style>

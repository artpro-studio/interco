<script lang="ts" setup>
    import {CreatePaymentsDto, getApiClientInitialParams, PaymentsControllerClient} from 'src/ApiClient/ApiClient';
    import {computed, onMounted, PropType, ref, Ref} from 'vue';
    import {useQuasar} from 'quasar';

    const $q = useQuasar();

    const emit = defineEmits(['update-model']);

    const props: {
        value: CreatePaymentsDto | null
    } = defineProps({
        value: {
            type: Object as PropType<CreatePaymentsDto>
        }
    });

    const currentModel = computed({
        get: () => props.value,
        set: (value) =>  emit('update-model', value)
    });

    const options: Ref<CreatePaymentsDto[]> =  ref([]);

    const create = async () => {
        const result = await new PaymentsControllerClient(getApiClientInitialParams()).getAll();
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            options.value = result.entity!;
        }
    };

    onMounted(() => {
        create();
    });
</script>

<template>
    <q-select
        v-model="currentModel"
        :options="options"
        label="Платежная система"
        option-label="name"
        outlined
    />
</template>

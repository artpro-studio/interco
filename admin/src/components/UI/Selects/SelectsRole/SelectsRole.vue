<script lang="ts" setup>
    import {FullUsersDtoRole} from 'src/ApiClient/ApiClient';
    import {computed, PropType, ref, Ref} from 'vue';
    import {dataRoles, IRole} from 'components/UI/Selects/SelectsRole/interface';

    const emit = defineEmits(['input', 'change']);

    const props: {
        value: FullUsersDtoRole | FullUsersDtoRole[] | null,
        multiple: boolean,
    } = defineProps({
        value: {
            type: Object as PropType<FullUsersDtoRole> || Array as PropType<FullUsersDtoRole[]>,
            required: true,
        },
        multiple: {
            type: Boolean,
            default: false,
        }
    });
    const options: Ref<IRole[]> = ref(dataRoles);

    const currentValue = computed({
        get: () => props.value,
        set: (value) => emit('input', value)
    });
</script>
<template>
    <q-select
        v-model="currentValue"
        :options="options"
        option-value="value"
        option-label="text"
        label="Роль"
        :multiple="multiple"
        :clearable="!multiple"
        :use-chips="multiple"
        @update:model-value="emit('change')"
        emit-value
        outlined
    />
</template>

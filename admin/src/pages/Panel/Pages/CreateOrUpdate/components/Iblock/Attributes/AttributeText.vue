<script lang="ts" setup>
    import { computed, onBeforeMount, ref } from 'vue';
    import { IAttributeType } from './inteface';

    interface IProps {
        data: any;
        type: IAttributeType;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const form = ref<any>(null);

    const isTextArea = computed(() => {
        return props.type === IAttributeType.TEXTAREA;
    });

    const onUpdate = () => {
        emit('on-change', form.value);
    };

    onBeforeMount(() => {
        form.value = props.data;
    });
</script>
<template>
    <div :class="{'row no-wrap q-gutter-md': !isTextArea}">
        <q-input
            v-for="(el, index) in form"
            :key="index"
            :type="isTextArea ? 'textarea' : 'text'"
            v-model="form[index]"
            :label="index.toString()"
            :class="{'q-mb-md': isTextArea}"
            @update:model-value="onUpdate"
            outlined
        />
    </div>
</template>

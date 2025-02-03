<script lang="ts" setup>
    import { computed, ref } from 'vue';
    import DatePicker from 'vue-datepicker-next';
    import 'vue-datepicker-next/locale/ru';

    interface IProps {
        modelValue: string;
        type?: string;
        label: string;
    }
    const props = withDefaults(defineProps<IProps>(), {
        type: 'date',
    });
    const emit = defineEmits(['update:modelValue']);

    const inputRef = ref(null);
    const inputPositionLeft = ref(0);

    const currentValue = computed({
        // Use computed to wrap the object
        get: () => new Date(props.modelValue),
        set: (value) => emit('update:modelValue', value),
    });

    const getFormat = computed(() => {
        if (props.type === 'datetime') {
            return 'DD.MM.YYYY HH:mm';
        }

        return 'DD.MM.YYYY';
    });

    const getFormatter = computed(() => {
        if (props.type === 'datetime') {
            return 'YYYY-MM-DDTHH:mm:ss';
        }

        return 'YYYY-MM-DD';
    });

    const onOpenPopup = () => {
        inputPositionLeft.value = inputRef.value?.$el ? inputRef.value?.$el.getBoundingClientRect().left : 0;
    };

    const onClosePopup = () => {
        inputPositionLeft.value = 0;
    };
</script>
<template>
    <date-picker
        v-model:value="currentValue"
        lang="ru"
        :type="type"
        :format="getFormat"
        :formatter="getFormatter"
        :popup-style="{
            left: inputPositionLeft + 'px',
        }"
        :default-value="currentValue"
        @open="onOpenPopup"
        @close="onClosePopup"
    >
        <template v-slot:input="prop">
            <q-input ref="inputRef" :model-value="prop.value" :disable="prop.disabled" :label="props.label" outlined />
        </template>
        <template v-slot:icon-clear>
            <q-icon name="close" size="sm" />
        </template>
        <template v-slot:icon-calendar>
            <q-icon name="calendar_today" size="sm" />
        </template>
    </date-picker>
</template>

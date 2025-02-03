<script lang="ts" setup>
    import {computed, ref, Ref} from 'vue';

    const emit = defineEmits(['update', 'change']);
    const props: {
        modelValue: string,
        disabled: boolean,
        isLiveSave: boolean,
    } = defineProps({
        modelValue: {
            required: true,
            type: String,
        },
        disabled: {
            required: false,
            type: Boolean,
            default: false,
        },
        isLiveSave: {
            required: false,
            type: Boolean,
            default: false,
        },
        isLiveLoading: {
            required: false,
            type: Boolean,
            default: false,
        },
    });
    const timout: Ref<any> = ref(null);

    const currentValue = computed({
        // Use computed to wrap the object
        get: () => props.modelValue,
        set: (value) => emit('update', value),
    });

    const changeKeyDown = () => {
        clearTimeout(timout.value);
        timout.value = setTimeout(() => {
            emit('change', currentValue.value);
        }, 1500);
    };

</script>
<template>
    <div class="form-text-area-components">
        <q-input
            v-model="currentValue"
            type="textarea"
            color="primary"
            @keydown="changeKeyDown"
            filled
        />
        <div class="form-text-area-components__loader q-mt-sm">
            <div class="row items-center" v-if="isLiveLoading && isLiveLoading">
                <q-circular-progress
                    indeterminate
                    size="20px"
                    color="primary"
                    class="q-mr-md"
                    :thickness="0.1"
                />
                <span>Идет сохранение</span>
            </div>
        </div>
    </div>
</template>
<style lang="scss" scoped>
    .form-text-area-components {
        &__loader {
            height: 24px;
        }
    }
</style>
<style lang="scss">
    .form-text-area-components {
        .q-field--filled .q-field__control:before {
            background-color: var(--q-gray-light);
        }
    }
</style>

<script lang="ts" setup>
    const props: {
        hiddenClose: boolean;
    } = defineProps({
        hiddenClose: {
            type: Boolean,
            default: false,
        },
    });
</script>

<template>
    <div class="form-edit__buttons">
        <div class="container container-form">
            <div class="row justify-end q-gutter-md">
                <q-btn v-if="!props.hiddenClose" color="negative" @click="$emit('cancel')" outline>Отмена</q-btn>
                <q-btn color="primary" type="submit" @click="$emit('success')">Сохранить</q-btn>
            </div>
        </div>
    </div>
</template>

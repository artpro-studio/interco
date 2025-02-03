<script lang="ts" setup>
    import Editor from '@tinymce/tinymce-vue';
    import { computed, ref, Ref } from 'vue';

    const emit = defineEmits(['update', 'change']);
    const props: {
        modelValue: string | null;
        disabled: boolean;
        isLiveSave: boolean;
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

    const init = {
        selector: 'textarea',
        menubar: false,
        statusbar: true,
        plugins: [
            'advlist',
            'autolink',
            'link',
            'lists',
            'charmap',
            'anchor',
            'pagebreak',
            'searchreplace',
            'wordcount',
            'visualblocks',
            'visualchars',
            'code',
            'insertdatetime',
            'table',
            'emoticons',
        ],
        toolbar:
            'undo redo | styles | bold italic | alignleft aligncenter alignright alignjustify | ' +
            'bullist numlist outdent indent | link | print fullscreen | ' +
            'forecolor backcolor emoticons code',
        contextmenu: false,
        mobile: {
            toolbar_drawer: 'floating',
        },
        language: 'ru',
        setup: function (editor: any) {
            editor.on('keydown', function () {
                clearTimeout(timout.value);
                timout.value = setTimeout(() => {
                    emit('change', currentValue.value);
                }, 1500);
            });
        },
    };

    const currentValue = computed({
        // Use computed to wrap the object
        get: () => props.modelValue,
        set: (value) => emit('update', value),
    });
</script>
<template>
    <div class="editor-components">
        <editor
            v-model="currentValue"
            :init="init"
            :toolbar="false"
            api-key="pqgh4mfih769m6k01zngd4q040pvif163577ppmxm17wx6uk"
            :disabled="disabled"
        />
        <div class="editor-components__loader q-mt-sm">
            <div class="row items-center" v-if="isLiveLoading && isLiveLoading">
                <q-circular-progress indeterminate size="20px" color="primary" class="q-mr-md" :thickness="0.1" />
                <span>Идет сохранение</span>
            </div>
        </div>
    </div>
</template>
<style lang="scss" scoped>
    .editor-components {
        &__loader {
            height: 24px;
        }
    }
</style>
<style lang="scss">
    .editor-components {
        .tox-tinymce {
            border: 1px var(--q-gray-light) solid;
        }
        .tox {
            .tox-toolbar-overlord {
                background-color: #f7f7fa;
            }
            .tox-toolbar__primary {
                background-color: #f7f7fa;
            }
            .tox-edit-area__iframe {
                background-color: #f7f7fa;
            }
            .tox-statusbar {
                background-color: #f7f7fa;
            }
        }
    }
</style>

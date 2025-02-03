<script lang="ts" setup>
    import {computed, PropType, ref, Ref, toRefs} from 'vue';
    import {
        CreateDropzoneDto,
        DropzoneControllerClient,
        FileParameter,
        getApiClientInitialParams, getBaseApiUrl
    } from 'src/ApiClient/ApiClient';
    import {useQuasar} from 'quasar';

    const $q = useQuasar();
    const emit = defineEmits(['uploadFile']);
    const props: {
        fileProp: CreateDropzoneDto,
    } = defineProps({
        fileProp: {
            type: Object as PropType<CreateDropzoneDto>,
            required: true,
        }
    });

    const file: Ref<CreateDropzoneDto | any> = ref(null);
    const baseUrl = getBaseApiUrl();
    const { fileProp } = toRefs(props);

    const pathFile = computed((): string => {
        return props.fileProp ? baseUrl + '/' + props.fileProp.path : '';
    });

    const uploadFile = async (file: any) => {
        const formData: FileParameter = {
            fileName: file.name,
            data: file
        };
        const result = await new DropzoneControllerClient(getApiClientInitialParams()).uploadFile(formData);
        if (result.isSuccess) {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'warning',
                message: 'Файл загружен'
            });
            fileProp.value = result.entity;
            emit('uploadFile', result.entity);
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        }
    };
</script>
<template>
    <q-file
        v-model="file"
        @update:model-value="uploadFile($event, true)"
        class="upload-file-components"
        :class="{'is-images': !!pathFile}"
        :style="{backgroundImage: 'url('+ pathFile +')'}"
        outlined
    >
        <template v-slot:default>
            <q-icon name="description" class="upload-file-components__icon" size="20px" />
        </template>
    </q-file>
</template>
<style lang='scss'>
    .upload-file-components {
        height: 50px;
        min-width: 50px;
        max-width: 50px;
        border-radius: 50%;
        cursor: pointer;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        position: relative;

        &:hover {
            .upload-file-components__icon {
                color: var(--q-dark);
            }
        }

        &.is-images {

            &:before {
                content:'' ;
                width: 100%;
                height: 100%;
                border-radius: 50%;
                background-color: rgba(255,255,255, .9);
                position: absolute;
                top: 0;
                left: 0;
                opacity: 0;
                transition: .4s all;
            }

            .upload-file-components__icon {
                opacity: 0;
            }
            .q-field__control {
                &:before {
                    opacity: 0;
                }
            }

            &:hover {
                &:before {
                    opacity: 1;
                }
                .upload-file-components__icon {
                    opacity: 1;
                }
                .q-field__control {
                    &:before {
                        opacity: 1;
                    }
                }
            }
        }

        &__icon {
            color: var(--q-gray);
            transition: .4s all;
        }

        .q-field__control {
            border-radius: 50%;
            min-height: 50px !important;

            &:before {
                border-radius: 50%;
                border: 1px dashed #d2d6da;
            }
            &:after {
                border: 2px dashed transparent;
            }
        }
        .q-field__control-container {
            position: relative;
            height: 50px;
            min-height: auto !important;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .q-field__native {
            padding: 0;
            width: 0px;
            div {
                display: none;
            }

            input {
                height: 50px !important;
            }
        }
    }
</style>

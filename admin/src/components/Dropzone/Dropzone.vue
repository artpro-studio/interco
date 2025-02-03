<script lang="ts" setup>
    import { onMounted, PropType, reactive, watch } from 'vue';
    import * as DropzoneJS from 'dropzone';
    import 'dropzone/dist/dropzone.css';
    import {
        CreateLibraryFilesDto,
        FileType,
        LibraryFilesControllerClient,
        getApiClientInitialParams,
        getBaseApiUrl,
        ResponseLibraryFiles,
    } from 'src/ApiClient/ApiClient';
    import { IMockFile } from './interface';

    const emit = defineEmits(['onAddFile', 'deleteFile']);

    const props: {
        id: string;
        title: string;
        filesProps: CreateLibraryFilesDto[];
        uploadMultiple: boolean;
    } = defineProps({
        id: {
            type: String,
            required: true,
            default: '0',
        },
        title: {
            type: String,
            required: true,
            default: 'Загрузка файла',
        },
        filesProps: {
            type: Array as PropType<CreateLibraryFilesDto[]>,
            required: false,
        },
    });

    const baseUrl: string = getBaseApiUrl();
    const files: Dropzone.DropzoneFile[] = reactive([]);
    let dropzone: DropzoneJS | null = null;

    watch(
        () => props.filesProps,
        (files) => {
            changeFiles(files);
        }
    );

    const onRemovedFile = (file: Dropzone.DropzoneFile) => {
        const indexFile = files.findIndex((el: Dropzone.DropzoneFile) => el.name === file.name);
        files.splice(indexFile, 1);

        emit('deleteFile', file);
    };

    const onAddFile = (file: Dropzone.DropzoneFile) => {
        if (file && file.xhr && file.xhr.response) {
            const result: ResponseLibraryFiles = JSON.parse(file.xhr.response);
            if (result.isSuccess) {
                files.push(file);
                emit('onAddFile', result.entity);
            }
        }
    };

    function toBase64(url: string, callback: any) {
        const image = new Image();
        image.crossOrigin = 'Anonymous';
        image.onload = function () {
            const canvas = document.createElement('canvas');
            const context = canvas.getContext('2d');
            canvas.height = image.naturalHeight;
            canvas.width = image.naturalWidth;
            context?.drawImage(image, 0, 0);
            let dataURL = canvas.toDataURL('image/jpeg');
            callback(dataURL);
        };
        image.src = url;
    }

    const addMockFile = (el: CreateLibraryFilesDto, previewDropZona: any) => {
        const mockFile: IMockFile = {
            fileId: el.id,
            secretKey: el.id,
            name: el.name,
            size: 1000,
            isDropzoneMockFile: true,
            status: 'success',
            accepted: true,
            noNeedDeleteFromServer: true,
        };
        dropzone!.displayExistingFile(mockFile, previewDropZona);
    };

    const changeFiles = (files: CreateLibraryFilesDto[]) => {
        if (files && files.length) {
            files.forEach((el) => {
                if (el.type === FileType.Images) {
                    if (el.id) {
                        toBase64(el.path, (dataURL: any) => {
                            const previewDropZona = dataURL.toString();
                            addMockFile(el, previewDropZona);
                        });
                    } else {
                        toBase64(baseUrl + '/' + el.path, (dataURL: any) => {
                            const previewDropZona = dataURL.toString();
                            addMockFile(el, previewDropZona);
                        });
                    }
                } else if (el) {
                    addMockFile(el, '');
                }
            });
        }
    };

    onMounted(() => {
        const apiConfig = getApiClientInitialParams();
        const headers = {
            Authorization: 'Bearer ' + apiConfig.AuthToken,
        };

        dropzone = new DropzoneJS.default(`#${props.id}`, {
            url: new LibraryFilesControllerClient(getApiClientInitialParams())['baseUrl'] + '/api/library-files/upload',
            addRemoveLinks: true,
            timeout: 0,
            autoProcessQueue: true,
            uploadMultiple: false,
            maxFiles: 1,
            dictDefaultMessage: 'Drop files here to upload',
            dictRemoveFile: '<i class="q-icon text-negative notranslate material-icons" aria-hidden="true" role="presentation" style="font-size: 20px;">delete</i>',
            dictInvalidFileType: 'Формат файла не разрешен для загрузки.',
            dictCancelUpload: 'Отменить загрузку',
            dictFallbackMessage: 'Ваш браузер не поддерживает загрузку файлов перетаскиванием.',
            dictFallbackText: 'Пожалуйста, воспользуйтесь формой ниже, чтобы загрузить файл обычным способом.',
            dictFileTooBig: 'Файл слишком большой ({{filesize}} Мб). Максимальный размер файла: {{maxFilesize}} Мб.',
            dictCancelUploadConfirmation: 'Вы уверены, что хотите отменить загрузку?',
            headers,
            success(file: any, response: ResponseLibraryFiles) {
                file.fileId = response.entity!.id;
                file.secretKey = response.entity!.id;
            },
        });

        dropzone.on('removedfile', onRemovedFile);
        dropzone.on('complete', onAddFile);

        changeFiles(props.filesProps);
    });
</script>

<template>
    <div class="dropzone-wrapper">
        <div class="my-dropzone" :id="props.id"></div>
        <div v-if="files?.length === 0 && filesProps?.length === 0" class="dropzone-wrapper__default">
            <q-icon class="dropzone-wrapper__icon" name="description" size="45px" />
            <span class="dropzone-wrapper__title">{{ title }} </span>
            <span class="dropzone-wrapper__desc">Переташите сюда файл</span>
        </div>
    </div>
</template>

<style lang="scss">
    .dropzone-wrapper {
        position: relative;

        &__default {
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            width: 100%;
            text-align: center;
            z-index: 0;
            margin-top: -40px;
        }

        &__title {
            font-size: 1.3em;
            line-height: 1;
            font-weight: bold;
            display: block;
            margin-top: 10px;
            margin-bottom: 3px;
            color: var(--q-gray);
        }

        &__desc {
            margin-bottom: 5px;
            color: var(--q-gray);
        }

        &__icon {
            color: var(--q-gray-light);
        }
    }
    .my-dropzone {
        border: 1px var(--q-gray-light) dashed;
        width: 100%;
        min-height: 200px;
        border-radius: 7px;
        cursor: pointer;
        background: transparent;
        position: relative;
        z-index: 2;
        display: flex;
        flex-wrap: wrap;
        padding: 15px 5px;

        .dz-remove {
            position: absolute;
            top: 10px;
            right: 10px;
            text-decoration: none;
            background-color: #fff;
            border-radius: 50%;
            z-index: 5;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dz-preview {
            width: 33.3333%;
            margin: 10px;
            position: relative;
            max-width: 250px;

            &.dz-error {
                position: relative;

                &:before {
                    content: '';
                    width: 100%;
                    height: calc(100% - 10px);
                    background-color: $negative;
                    position: absolute;
                    top: 0;
                    left: 0;
                    opacity: 0.2;
                    z-index: 2;
                    margin: 0px;
                    border-radius: 5px;
                }
            }

            &:hover {
                .dz-details {
                    opacity: 1;
                }
                .dz-image {
                    &:before {
                        opacity: 1;
                        z-index: 3;
                    }
                }
                .dz-error-message {
                    opacity: 1;
                }
            }

            .dz-error-message {
                position: absolute;
                bottom: 10px;
                left: 10px;
                z-index: 3;
                transition: 0.4s all;
                opacity: 0;
                color: $negative;
            }

            .dz-details {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                padding: 20px;
                opacity: 0;
                transition: 0.4s all;
                z-index: 4;
            }

            .dz-image {
                position: relative;
                height: 100%;

                &:before {
                    content: '';
                    width: 100%;
                    height: 100%;
                    background-color: rgba(255, 255, 255, 0.9);
                    position: absolute;
                    top: 0;
                    left: 0;
                    transition: 0.4s all;
                    opacity: 0;
                }

                img {
                    width: 100%;
                    border-radius: 5px;
                }
            }

            .dz-success-mark {
                display: none;
            }

            .dz-error-mark {
                display: none;
            }
        }
    }
</style>

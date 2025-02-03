<script lang="ts" setup>
    import { getApiClientInitialParams, LibraryFilesControllerClient } from '@/ApiClient/ApiClient';
    import { api } from '@/boot/axios';
    import useResultException from '@/helpers/useResultException';
    import { computed, onMounted, Ref, ref } from 'vue';
    import { StatusLoadFile } from './interface';

    interface IProps {
        uploadUrl: any;
        file: any;
        index: number;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-delete', 'update-file']);

    const { resultError } = useResultException();

    const localFile: any = ref(null);
    const status: Ref<StatusLoadFile> = ref(StatusLoadFile.EMPTY);
    const progress = ref(0);
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const error: Ref<string[]> = ref([]);
    const isModal: boolean = false;

    const getStatusLoadFile = computed((): typeof StatusLoadFile => {
        return StatusLoadFile;
    });

    const getClass = computed(() => {
        return {
            'is-view': status.value !== getStatusLoadFile.value.EMPTY,
            'is-complite': localFile.value.id,
            'is-loading': !localFile.value.id,
            'is-error': status.value === getStatusLoadFile.value.ERROR,
            'is-not-preview': !localFile.value.urlPreview && progress.value === 0,
            'is-load-preview': !localFile.value.id && localFile.value.url,
        };
    });

    const onUploadProgress = (event: any) => {
        progress.value = Math.round((event.loaded / event.total) * 100);
    };

    const downloadFile = () => {
        console.log('скачать файл');
    };

    const deleteFile = async () => {
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).delete(localFile.value.id);
        if (!result.isSuccess) {
            resultError(result, null);
            emit('on-delete', localFile.value);
        } else {
            emit('on-delete', localFile.value);
        }
    };

    const openPreview = () => {
        console.log('openPreview');
    };

    const onInput = () => {
        const config: {
            onUploadProgress: (event: any) => void;
        } = {
            onUploadProgress: onUploadProgress,
        };
        status.value = StatusLoadFile.EMPTY;
        const form = new FormData();
        form.append('file', localFile.value.data);
        api.post(props.uploadUrl, form, config)
            .then((data: any) => {
                localFile.value = data;
                status.value = StatusLoadFile.EMPTY;
                const result = data.data;
                emit('update-file', {
                    index: props.index,
                    file: result.isSuccess ? result.entity : null,
                });
            })
            .catch((data: any) => {
                status.value = StatusLoadFile.ERROR;
                localFile.value.url = '';
                console.log(data);
                // data.response.data.errors.file.forEach((el: string) => {
                //     error.value.push(el);
                // });
            })
            .finally(() => {
                progress.value = 0;
            });
    };

    onMounted(() => {
        localFile.value = props.file;
        if (!props.file.id) {
            onInput();
        }
    });
</script>
<template>
    <div class="dropzona-preview-components">
        <div class="row items-center justify-center" v-if="!localFile">
            <q-spinner color="primary" size="4em" :thickness="3" />
        </div>
        <template v-else>
            <div class="dropzona-preview-components__header">
                <div v-if="localFile.name" class="dropzona-preview-components__name">
                    {{ localFile.name }}
                </div>
                <q-btn v-if="localFile.id" icon="more_vert" size="small" class="dropzona-preview-components__menu" round>
                    <q-menu anchor="center right" self="center right" class="main-sidebar__item__children">
                        <q-list class="main-sidebar__item__children__list">
                            <q-item class="main-sidebar__item__children__list__item" clickable v-close-popup @click="downloadFile">
                                <q-item-section class="main-sidebar__item__children__list__item__section"> Скачать файл </q-item-section>
                            </q-item>
                            <q-item class="main-sidebar__item__children__list__item" clickable v-close-popup @click="deleteFile">
                                <q-item-section class="main-sidebar__item__children__list__item__section"> Удалить файл </q-item-section>
                            </q-item>
                        </q-list>
                    </q-menu>
                </q-btn>
            </div>
            <div class="dropzona-preview-components__wrap" :class="getClass" @click="openPreview">
                <div class="dropzona-preview-components__overvlow">
                    <div class="dropzona-preview-components__body">
                        <div v-if="localFile.id" class="dropzona-preview-components__preview" :class="{ 'no-preview': !localFile.path }">
                            <img v-if="localFile.path" class="dropzona-preview-components__img" :src="localFile.path" alt="" />
                            <q-icon v-else name="description" size="40px" color="#676A6C"></q-icon>
                        </div>
                        <div v-else>
                            <div class="dropzona-preview-components__load">
                                <img :src="localFile.url" alt="" />
                                <div v-if="progress" class="dropzona-preview-components__progress">
                                    <div class="progress__bar">
                                        <div ref="fileInput" class="progress" :style="{ width: `${progress}%` }"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="dropzona-preview-components__status" :class="{ 'is-error': status === getStatusLoadFile.ERROR }">
                    <q-icon v-if="!status" name="zoom_in" size="30px" />
                    <q-icon v-if="status === getStatusLoadFile.COMPLETE" name="done" size="30px" />
                    <template v-if="status === getStatusLoadFile.ERROR">
                        <q-icon name="cancel" size="30px" />
                        <div class="dropzona-preview-components__status__text">Не удалось загрузить файл</div>
                        <div class="dropzona-preview-components__status__link" @click="onInput">Загрузить снова</div>
                    </template>
                </div>
            </div>
        </template>
        <DropzonaModal v-if="isModal && localFile" :file="localFile" @close="isModal = false" />
    </div>
</template>
<style lang="scss" scoped>
    .dropzona-preview-components {
        background: #f7f7fa;
        border-radius: 8px;
        width: 180px;
        height: 200px;
        margin: 9px;
        padding: 16px;
        padding-top: 7px;
        text-align: left;
        position: relative;
        &__img {
            max-width: 100%;
        }
        &__loader {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        &__header {
            display: flex;
            flex-wrap: nowrap;
            align-items: center;
            justify-content: space-between;
            min-height: 30px;
        }
        &__name {
            font-size: 12px;
            white-space: nowrap;
            max-width: 165px;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        &__preview {
            height: 100%;
            &.no-preview {
                display: flex;
                align-items: center;
                justify-content: center;
            }
        }
        &__overvlow {
            border-radius: 6px;
            overflow: hidden;
        }
        &__wrap {
            &.is-loading {
                .dropzona-preview-components__body {
                    background-color: #f2f6fc;
                }
                &.is-load-preview {
                    .dropzona-preview-components__body {
                        background-color: #fff;
                    }
                }
            }
            &.is-complite {
                cursor: pointer;
                &:hover {
                    .dropzona-preview-components__body {
                        position: relative;
                        filter: blur(25px);
                        &::before {
                            content: '';
                            width: 100%;
                            height: 100%;
                            background-color: rgba(66, 82, 104, 0.2);
                            position: absolute;
                            top: 0;
                            left: 0;
                            border-radius: 6px;
                        }
                    }
                    .dropzona-preview-components__status {
                        display: block;
                    }
                }
            }
            &.is-view {
                .dropzona-preview-components__body {
                    position: relative;
                    filter: blur(0px) !important;
                    &::before {
                        content: '';
                        width: 100%;
                        height: 100%;
                        background-color: rgba(0, 0, 0, 0.2);
                        position: absolute;
                        top: 0;
                        left: 0;
                        border-radius: 6px;
                    }
                }
                .dropzona-preview-components__status {
                    display: block;
                }
            }
            &.is-error,
            &.is-not-preview {
                .dropzona-preview-components__body {
                    background-color: #f2f6fc;
                    &::before {
                        display: none;
                    }
                }
            }
        }
        &__body {
            background-color: #fff;
            height: 140px;
            border-radius: 6px;
            margin-top: 5px;
            overflow: hidden;
        }
        &__status {
            position: absolute;
            top: calc(50% - 20px);
            text-align: center;
            width: 100%;
            left: 0;
            display: none;
            font-size: 12px;
            &.is-view {
                display: block;
            }
            &.is-error {
                top: calc(50% - 37px);
                i {
                    color: #f1453d;
                }
            }
            &__text {
                margin-top: -5px;
            }
            &__link {
                text-decoration: underline;
                cursor: pointer;
            }
            &__tooltip {
                color: #676a6c;
            }
            i {
                color: #fff;
            }
        }
        &__progress {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 8px;
            background-color: rgba(170, 171, 171, 0.4);
            display: flex;
            align-items: center;
            justify-content: center;
            .progress {
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                background: #676a6c;
                border-radius: 20px;
                &__bar {
                    position: relative;
                    width: 112px;
                    height: 16px;
                    text-align: center;
                    font-size: 14px;
                    line-height: 16px;
                    background: rgba(255, 255, 255, 1);
                    border: 1px solid #ffffff;
                    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.1);
                    border-radius: 20px;
                }
            }
        }
    }
</style>
<style lang="scss">
    .dropzona-preview-components__menu {
        min-width: 20px !important;
        min-height: 20px !important;
        margin-right: -7px;
        .q-menu {
            z-index: 6005;
            &__drop-down {
                min-width: 110px;
                top: 20px;
            }
        }
        .v-button {
            width: 20px !important;
            height: 20px !important;
            padding: 0;
            margin: 0;
        }
    }
    .dropzona-preview-components__select {
        margin-top: 6px;
        height: 18px;
        .is-active {
            .v-select__text .value {
                color: #000;
            }
        }
        .v-select {
            max-width: 100%;
            &__clearable {
                display: none;
            }
            &__icon-arrow {
                position: relative;
                left: 0;
                top: 1px;
            }
            &__text {
                padding: 0;
                min-height: auto;
                border: none;
                background-color: transparent;
                font-size: 12px;
                justify-content: start;
                .value {
                    color: #999999;
                    max-width: 100%;
                }
            }
            &__caret {
                font-size: 16px !important;
                color: #a4a6b3 !important;
            }
            &__dropdown {
                &.active {
                    button {
                        font-size: 12px;
                        padding: 8px 12px;
                    }
                }
            }
        }
    }
</style>

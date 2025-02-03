<script lang="ts" setup>
    import { CreateLibraryFilesDto, getApiClientInitialParams, LibraryFilesControllerClient } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { ISearchLibrary } from '@/pages/Panel/Library/Pages/Index/interface';
    import LibraryFileDropzona from './LibraryFileDropzona.vue';
    import SelectTypeFile from '@/pages/Panel/Library/Pages/Index/components/Panel/SelectTypeFile.vue';
    import { RouterName } from '@/router/routerName';
    import { computed, nextTick, onMounted, Ref, ref, watch } from 'vue';
    import { useRoute } from 'vue-router';

    interface IProps {
        isMultiple: boolean;
    }

    const props = defineProps<IProps>();
    const emit = defineEmits(['on-close', 'on-add-file', 'on-add-file-all']);

    const { resultError } = useResultException();
    const route = useRoute();

    const libraryHeaderRef = ref<any | null>(null);
    const isLoading = ref(false);
    const isSelectMode = ref(false);
    const selectFiles = ref<any>([]);
    const search: Ref<ISearchLibrary> = ref({
        search: null,
        type: null,
    });
    const directory: Ref<number | null> = ref(null);
    const files: Ref<CreateLibraryFilesDto[]> = ref([]);
    const paginations = ref({
        limit: 100,
        page: 1,
        count: 0,
    });
    const panelHeight = ref(0);

    watch(
        () => route.name,
        (newRouteName: any) => {
            if (newRouteName === RouterName.Library) {
                directory.value = null;
                getInfo();
            }
        }
    );

    const getStyle = computed(() => {
        return {
            height: `calc(100vh - 150px - ${panelHeight.value}px)`,
        };
    });

    const getTotalPages = computed(() => {
        return Math.ceil(paginations.value.count / paginations.value.limit);
    });

    const getSelectIdsFiles = computed(() => {
        return selectFiles.value.map((el: any) => el.id);
    });

    const onCloseSelectMode = () => {
        isSelectMode.value = false;
        selectFiles.value = [];
    };

    const onSelect = (file: any) => {
        selectFiles.value.push(file);
        isSelectMode.value = true;
    };

    const onRemoveSelect = (id: number) => {
        selectFiles.value = selectFiles.value.filter((el: any) => el.id !== id);
        isSelectMode.value = true;
    };

    const onChengeRouter = (id: number) => {
        directory.value = id;
        getInfo();
    };

    const backDirectory = () => {
        directory.value = null;
        getInfo();
    };

    const onScroll = ({ verticalPercentage }: { verticalPercentage: number }) => {
        if (verticalPercentage > 0.9 && paginations.value.page < getTotalPages.value && !isLoading.value) {
            isLoading.value = true;
            paginations.value.page++;
            getInfo();
        }
    };

    const getInfo = async () => {
        isLoading.value = true;
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).get(
            paginations.value.limit,
            paginations.value.page,
            (search.value?.type as any) || undefined,
            search.value?.search || undefined,
            directory.value ? directory.value : undefined
        );
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            files.value = [...files.value, ...result.entity!.entity!];
            paginations.value.count = result.entity?.count || 0;
        }
        isLoading.value = false;
    };

    onMounted(() => {
        getInfo();
        nextTick(() => {
            console.log('test', libraryHeaderRef.value);
            panelHeight.value = libraryHeaderRef.value?.$el.offsetHeight || 0;
        });
    });
</script>
<template>
    <div class="library">
        <q-btn class="library-close" @click="emit('on-close')"> <q-icon name="close" /> ESC </q-btn>
        <q-card ref="libraryHeaderRef" class="library-header">
            <q-card-section>
                <div class="row items-center q-mb-md">
                    <q-btn v-if="directory" icon="arrow_back" class="q-mr-sm" @click="backDirectory" round></q-btn>
                    <div class="library-header__title bold text-h4">Библиотека файлов</div>
                </div>
                <q-separator />
                <div class="library-header__search q-mt-md">
                    <template v-if="isSelectMode">
                        <div class="row items-center">
                            <q-btn color="primary" icon="done" @click="emit('on-add-file-all', selectFiles)" flat>
                                <q-tooltip>Выбрать файлы</q-tooltip>
                            </q-btn>
                            <q-btn color="primary" flat @click="onCloseSelectMode">Отмена</q-btn>
                        </div>
                    </template>

                    <q-form v-else class="library-header__search__form row items-center justify-between">
                        <div class="row items-center q-gutter-lg">
                            <div class="library-header__search__form__field">
                                <q-input v-model="search.search" label="Название файла" clearable outlined />
                            </div>
                            <div class="library-header__search__form__field">
                                <select-type-file v-model:modalValue="search.type" @update-model="search.type = $event" />
                            </div>
                        </div>

                        <div>
                            <q-btn color="primary" @click="getInfo">Применить</q-btn>
                        </div>
                    </q-form>
                </div>
            </q-card-section>
        </q-card>
        <q-card class="library__body q-mt-lg">
            <q-card-section>
                <q-scroll-area v-if="files.length" class="library-component__scroll" :style="getStyle" @scroll="onScroll">
                    <div class="library-components row items-center" v-if="files.length">
                        <library-file-dropzona
                            v-for="item in files"
                            :key="item.id"
                            :file="item"
                            :is-select-mode="isSelectMode"
                            :select-files="selectFiles"
                            :is-multiple="props.isMultiple"
                            :select-ids="getSelectIdsFiles"
                            @on-chenge-router="onChengeRouter"
                            @on-update="getInfo"
                            @on-click="emit('on-add-file', $event)"
                            @on-select="onSelect"
                            @on-remove-select="onRemoveSelect"
                        />
                    </div>
                </q-scroll-area>

                <no-items v-else />
            </q-card-section>
        </q-card>
    </div>
</template>
<style lang="scss" scoped>
    .library {
        padding-top: 25px;
        &-close {
            position: absolute;
            top: 0;
            right: 15px;
            font-size: 18px;
            color: #fff;
        }
        &-header {
            &__search {
                &__form {
                    &__field {
                        min-width: 300px;
                    }
                }
            }
        }
    }
</style>

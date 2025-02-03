<script lang="ts" setup>
    import { computed, onMounted, Ref, ref } from 'vue';
    import { CreateLibraryFilesDto, LibraryFilesControllerClient, getApiClientInitialParams } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import ContentViewPreview from './ContentViewPreview.vue';
    import ModalsInfo from '@/components/Modals/ModalsInfo.vue';

    const { resultError } = useResultException();

    const emit = defineEmits(['update-model', 'on-reload']);

    const props: {
        value: boolean;
        id: number;
    } = defineProps({
        value: {
            type: Boolean,
            required: true,
        },
        id: {
            type: Number,
            required: true,
        },
    });

    const isLoading: Ref<boolean> = ref(true);
    const file: Ref<CreateLibraryFilesDto | null> = ref(null);
    const isOpenDeleteFile = ref(false);

    const currentValue = computed({
        get: () => props.value,
        set: (value: boolean | null) => {
            emit('update-model', value);
        },
    });

    const fileSize = computed((): string => {
        return (file.value?.size / 1048576).toFixed(2) + 'МБ.';
    });

    const onDelete = async () => {
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).delete(props.id);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            isOpenDeleteFile.value = false;
            currentValue.value = false;
            emit('on-reload');
        }
    };

    const getInfo = async () => {
        const result = await new LibraryFilesControllerClient(getApiClientInitialParams()).getOne(props.id);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            file.value = result.entity;
        }
        isLoading.value = false;
    };

    onMounted(() => {
        getInfo();
    });
</script>
<template>
    <q-dialog v-model="currentValue" class="content-view-components">
        <q-btn class="content-view-components__close" @click="currentValue = false"> <q-icon name="close" /> ESC </q-btn>
        <div class="row items-center justify-center" v-if="isLoading">
            <q-spinner color="primary" size="4em" :thickness="2" />
        </div>
        <div v-else class="content-view-components__warapper row items-start no-wrap justify-between">
            <q-scroll-area class="content-view-components__body">
                <content-view-preview :file="file" />
            </q-scroll-area>
            <q-card class="content-view-components__sidebar">
                <q-card-section>
                    <div class="content-view-components__header">
                        <div class="content-view-components__title text-h4">{{ file?.name }}</div>
                        <div class="content-view-components__info">
                            <span>Размер: {{ fileSize }}</span>
                        </div>
                    </div>

                    <div class="content-view-components__sidebar__button q-mt-md">
                        <q-btn color="negative" flat class="full" @click="isOpenDeleteFile = true">Удалить</q-btn>
                    </div>
                </q-card-section>
            </q-card>
        </div>
    </q-dialog>
    <q-dialog v-model="isOpenDeleteFile">
        <modals-info title="Вы точно хотите удалить файл?" text="Удаленный файл нельзя будет восстановить" @on-success="onDelete" />
    </q-dialog>
</template>
<style lang="scss" scoped>
    .content-view-components {
        &__close {
            position: absolute;
            top: 0;
            right: 15px;
            font-size: 18px;
            color: #fff;
        }
        &__warapper {
            width: 100%;
            max-width: none;
        }

        &__body {
            width: calc(100% - 420px);
            height: calc(100vh - 100px);
        }

        &__sidebar {
            width: 400px;
            height: calc(100vh - 100px);
        }

        &__images {
            width: 100%;
            height: auto;
        }
    }
</style>

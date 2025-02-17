<script lang="ts" setup>
    import { onMounted, ref } from 'vue';
    import IblockSectionCreateOrUpdate from './IblockSectionCreateOrUpdate.vue';
    import { PagesIblockSectionDto } from '@/ApiClient/ApiClient';

    interface IProps {
        sections?: PagesIblockSectionDto[] | null
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const localSections = ref<PagesIblockSectionDto[]>([]);
    const isOpenModaCreateOrUpdate = ref(false);
    const dataEdit = ref<{
        index: number,
        data: PagesIblockSectionDto
    } | null>(null);

    const onCloseCreateOrUpdate = () => {
        isOpenModaCreateOrUpdate.value = false;
        dataEdit.value = null;
    };

    const onUpdate = (index: number) => {
        console.log('tese');
        dataEdit.value = {
            index,
            data: localSections.value[index]!
        };
        isOpenModaCreateOrUpdate.value = true;
    };

    const onRemove = (index: number) => {
        localSections.value.splice(index, 1);
        emit('on-change', localSections.value);
    };

    const onChange = (data: PagesIblockSectionDto) => {
        if (data.id) {
            const findIndex = localSections.value.findIndex((el) => el.id === data.id);
            if (findIndex > -1) {
                localSections.value[findIndex] = data;
            }
        } else {
            localSections.value.push(data);
        }
        emit('on-change', localSections.value);
        onCloseCreateOrUpdate();
    };

    onMounted(() => {
        localSections.value = props.sections || [];
    });
</script>
<template>
    <div class="iblock-sections">
        <div class="text-h5 q-mb-md">Разделы</div>
        <div class="row q-mb-md">
            <q-chip
                v-for="(item, index) in localSections"
                :key="item.id || index"
                removable
                clickable
                @remove="onRemove(index)"
                @click.stop.prevent="onUpdate(index)"
            >
                {{ item?.value![0].value }}
            </q-chip>
        </div>
        <q-btn icon="add" color="primary" @click="isOpenModaCreateOrUpdate = true" round size="small" />
    </div>
    <q-dialog v-model="isOpenModaCreateOrUpdate" @hide="onCloseCreateOrUpdate">
        <iblock-section-create-or-update :data="dataEdit?.data" @on-change="onChange" @on-close="onCloseCreateOrUpdate" />
    </q-dialog>
</template>

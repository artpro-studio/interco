<script lang="ts" setup>
    import { IFieldTypeSeo, ILangTypeSeo, PagesSeoParamsDto } from '@/ApiClient/ApiClient';
    import {  onMounted, ref } from 'vue';
    import SeoParamsItem from './SeoParamsItem.vue';
    import { useQuasar } from 'quasar';

    interface IProps {
        data?: PagesSeoParamsDto[] | null,
    }

    interface IData {
        lang: ILangTypeSeo,
        data: PagesSeoParamsDto[];
    }

    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const $q = useQuasar();

    const isLoading = ref(true);
    const form = ref<IData[]>([]);
    const fields = [IFieldTypeSeo.Title, IFieldTypeSeo.Description, IFieldTypeSeo.Keywords];
    const langs = [ILangTypeSeo.RuRU, ILangTypeSeo.EnUS, ILangTypeSeo.ZhCN];
    const parseLang = {
        [ILangTypeSeo.RuRU]: 'Русский',
        [ILangTypeSeo.EnUS]: 'Английский',
        [ILangTypeSeo.ZhCN]: 'Китайский',
    };

    const getDataField = (lang: ILangTypeSeo):PagesSeoParamsDto[]  => {
        const result: PagesSeoParamsDto[] = [];
        for (let i = 0; i < 3; i++) {
            result.push({
                content: '',
                lang,
                fieldType: fields[i]
            });
        }

        return result;
    };

    const onAddParams = () => {
        if (form.value.length >= 3) {
            $q.notify({
                message: 'Нельзя добавить больше 3 языков',
                color: 'negative',
            });
            return;
        }
        const lang = langs.filter((el) => {
            const formLang: ILangTypeSeo[] = [];
            form.value.forEach((item) => formLang.push(item.lang));
            return !formLang.includes(el);
        });
        form.value.push({
            lang: lang[0],
            data: getDataField(lang[0]),
        });
    };

    const onChange = (data: PagesSeoParamsDto, index: number, indx: number) => {
        form.value[index].data[indx] = data;
        const result: PagesSeoParamsDto[] = [];
        form.value.forEach((el) => {
            result.push(...el.data);
        });
        emit('on-change', result);
    };

    onMounted(() => {
        props.data?.forEach((el) => {
            const findLangIndex= form.value.findIndex((item) => item.lang === el.lang);
            if (findLangIndex > -1) {
                form.value[findLangIndex] = {
                    lang: form.value[findLangIndex].lang,
                    data: [...form.value[findLangIndex].data, el]
                };
            } else {
                form.value.push({
                    lang: el.lang!,
                    data: [el]
                });
            }
        });
        isLoading.value = false;
    });
</script>
<template>
    <div class="row items-center justify-center" v-if="isLoading">
        <q-spinner color="primary" size="4em" :thickness="2" />
    </div>
    <div v-else v-for="(item, index) in form" :key="index" class="seo-params">
        <div class="text-h4 q-mb-lg q-pb-md">{{ parseLang[item.lang] }}</div>
        <SeoParamsItem v-for="(el, indx) in item.data" :key="el.lang! + indx " :data="el" @on-change="onChange($event, index, indx)" />
    </div>

    <q-btn color="primary" class="q-mt-md" @click="onAddParams">Добавить</q-btn>
</template>
<style lang="scss" scoped>
    .seo-params {
        border-bottom: 1px var(--q-blue-light) solid;
        margin-bottom: 20px;
    }
</style>

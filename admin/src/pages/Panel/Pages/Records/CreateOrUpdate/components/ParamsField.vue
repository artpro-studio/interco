<!-- eslint-disable @typescript-eslint/no-unused-vars -->
<script lang="ts" setup>
    import { FullPagesParamsDto, ILangPages, ITypePagesParams, PagesParamsFieldDto } from '@/ApiClient/ApiClient';
    import { computed, onBeforeMount, ref } from 'vue';
    import DatePicker from '@/components/UI/DatePicker/DatePicker.vue';
    import Dropzona from '@/components/NewDropzone/Dropzona.vue';

    interface IProps {
        data: PagesParamsFieldDto;
        param: FullPagesParamsDto;
        label: string;
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);
    const localValue = ref<PagesParamsFieldDto>({
        value: [
            {
                lang: ILangPages.RuRU,
                value: '',
            },
            {
                lang: ILangPages.EnUS,
                value: '',
            },
            {
                lang: ILangPages.ZhCN,
                value: '',
            },
        ],
        params: props.param
    });

    const onUpdate = () => {
        emit('on-change', localValue.value);
    };

    const getFilesImages = computed(() => {
        const thisValue = localValue.value?.value?.length && !!localValue.value.value[0].value ? JSON.parse(localValue.value.value[0].value as any) : null;
        if (thisValue) {
            if (Array.isArray(thisValue)) {
                return thisValue;
            }
            return [thisValue];
        }
        return [];
    });

    const onAddImage = (event: any) => {
        localValue.value.value = localValue.value.value?.map((el) => {
            el.value = JSON.stringify(event);
            return el;
        });
        onUpdate();
    };

    const onRemoveImage = (event: any) => {
        let thisValue = localValue.value?.value?.length && !!localValue.value.value[0].value ? JSON.parse(localValue.value.value[0].value as any) : null;
        if (thisValue) {
            if (Array.isArray(thisValue)) {
                thisValue = thisValue.filter((el) => el.id !== event.id);
            } else {
                thisValue = '';
            }

            localValue.value.value = localValue.value.value?.map((el) => {
                el.value = !!thisValue ? JSON.stringify(thisValue) : '';
                return el;
            });
        }

        onUpdate();
    };

    onBeforeMount(() => {
        localValue.value = {
            ...localValue.value,
            ...props.data,
            value: props.data?.value?.length ? props.data.value : localValue.value.value
        };
    });
</script>
<template>

    <div class="section-create-form__field q-mb-lg">
        <div class="text-h5 q-mb-md">{{ label }}</div>
        <temaplte v-if="param.type === ITypePagesParams.Text">
            <div class="row no-wrap q-gutter-md">
                <div v-for="(item, index) in localValue.value" :key="item.lang! + index" class="full">
                    <q-input
                        v-model="item.value"
                        :label="item.lang?.toString()"
                        class="full"
                        @update:model-value="onUpdate"
                        outlined
                    />
                </div>
            </div>
        </temaplte>
        <temaplte v-if="param.type === ITypePagesParams.Number">
            <div class="row no-wrap q-gutter-md">
                <div v-for="(item, index) in localValue.value" :key="item.lang! + index" class="full">
                    <q-input
                        type="number"
                        v-model="item.value"
                        :label="item.lang?.toString()"
                        class="full"
                        @update:model-value="onUpdate"
                        outlined
                    />
                </div>
            </div>
        </temaplte>
        <temaplte v-if="param.type === ITypePagesParams.Textarea">
            <div class="row no-wrap q-gutter-md">
                <div v-for="(item, index) in localValue.value" :key="item.lang! + index" class="full">
                    <q-input
                        type="textarea"
                        v-model="item.value"
                        :label="item.lang?.toString()"
                        class="full"
                        @update:model-value="onUpdate"
                        outlined
                    />
                </div>
            </div>
        </temaplte>
        <temaplte v-if="param.type === ITypePagesParams.Editor">
            <div class="row no-wrap q-gutter-md">
                <div v-for="(item, index) in localValue.value" :key="item.lang! + index" class="full">
                    <q-editor
                        type="textarea"
                        v-model="item.value"
                        :label="item.lang?.toString()"
                        class="full"
                        :toolbar="[
                            ['bold', 'italic', 'underline'],
                            ['unordered', 'ordered'],
                            [{
                                label: $q.lang.editor.formatting,
                                icon: $q.iconSet.editor.formatting,
                                list: 'no-icons',
                                options: ['p', 'code']
                            }]
                        ]"
                        @update:model-value="onUpdate"
                        outlined
                    />
                </div>
            </div>
        </temaplte>
        <temaplte  v-if="param.type === ITypePagesParams.Date || param.type === ITypePagesParams.Datetime">
            <div class="row no-wrap q-gutter-md">
                <div v-for="(item, index) in localValue.value" :key="item.lang! + index" class="full">
                    <date-picker
                        v-model:model-value="item.value"
                        :type="param.type === ITypePagesParams.Datetime ? 'datetime' : undefined"
                        :label="label"
                        @update:model-value="(event) => {
                            item.value = event;
                            onUpdate();
                        }"
                        outlined
                    />
                </div>
            </div>
        </temaplte>
        <template v-if="param.type === ITypePagesParams.Image || param.type === ITypePagesParams.Gallary">
            <Dropzona :title="label" :files="getFilesImages" :is-multiple="param.type === ITypePagesParams.Gallary" @on-add-file="onAddImage" @on-delete-file="onRemoveImage" />
        </template>
    </div>
</template>

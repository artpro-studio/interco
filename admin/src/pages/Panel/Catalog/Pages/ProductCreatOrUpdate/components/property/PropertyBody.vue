<script lang="ts" setup>
    import {
        CreateProductPropertyesDtoType,
        FullPropertyLinksDto,
        getApiClientInitialParams,
        PropertyLinkControllerClient,
        Result
    } from 'src/ApiClient/ApiClient';
    import {PropType} from 'vue';
    import PropertyListKey from './PropertyLinksKey.vue';
    import PropertyList from './PropertyList.vue';
    import {useQuasar} from 'quasar';
    import PropertyText from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/PropertyText.vue';
    import PropertyEditor from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/PropertyEditor.vue';
    import PropertyTextArea
        from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/PropertyTextArea.vue';
    import PropertyTextKey
        from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/PropertyTextKey.vue';
    import PropertyFiles from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/PropertyFiles.vue';
    import PropertyOptionFile
        from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/PropertyOptionFile.vue';


    const $q = useQuasar();

    const emit = defineEmits(['delete']);
    const props: {
        // ID товара
        id: number,
        // ID торгового предложения
        idCommercial: number,
        propertyes: FullPropertyLinksDto[],
    } = defineProps({
        id: {
            required: false,
            type: Number,
        },
        idCommercial: {
            required: false,
            type: Number,
        },
        propertyes: {
            required: true,
            type: Object as PropType<FullPropertyLinksDto[]>,
        }
    });

    const deleteProperty = async (id: number) => {
        const result: Result = await new PropertyLinkControllerClient(getApiClientInitialParams()).delete(id.toString());

        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Свойство удалено'
            });
            emit('delete');
        }
    };

</script>
<template>
    <div class="propertyes">
        <div
            class="propertyes__item"
            v-for="(item, index) in props.propertyes"
            :key="index"
        >
            <property-list-key
                v-if="item.productProperty.type === CreateProductPropertyesDtoType.ListKey"
                :item="item"
                :id="id"
                @delete="deleteProperty"
            />
            <property-list
                v-if="item.productProperty.type === CreateProductPropertyesDtoType.List"
                :item="item"
                :id="id"
                @delete="deleteProperty"
            />
            <property-text
                v-if="item.productProperty.type === CreateProductPropertyesDtoType.Text"
                :item="item"
                :id="id"
                @delete="deleteProperty"
            />
            <property-text-key
                v-if="item.productProperty.type === CreateProductPropertyesDtoType.TextKey"
                :item="item"
                :id="id"
                @delete="deleteProperty"
            />
            <property-editor
                v-if="item.productProperty.type === CreateProductPropertyesDtoType.Editor"
                :item="item"
                :id="id"
                @delete="deleteProperty"
            />
            <property-text-area
                v-if="item.productProperty.type === CreateProductPropertyesDtoType.Textarea"
                :item="item"
                :id="id"
                @delete="deleteProperty"
            />
            <property-files
                v-if="item.productProperty.type === CreateProductPropertyesDtoType.File"
                :item="item"
                :id="id"
                @delete="deleteProperty"
            />
            <property-option-file
                v-if="item.productProperty.type === CreateProductPropertyesDtoType.Color"
                :item="item"
                :id="id"
                @delete="deleteProperty"
            />
        </div>
    </div>
</template>

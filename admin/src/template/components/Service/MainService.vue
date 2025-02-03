<script lang="ts" setup>
    import MainServiceItem from './MainServiceItem.vue';
    import { IService } from 'pages/Main/Home/components/interface';
    import { PropType } from 'vue';

    interface IServiceImages {
        path: string;
    }
    interface IServiceFields {
        title: string;
        desc: string;
        images: IServiceImages;
    }
    interface IService {
        title: string;
        fields: IServiceFields[];
    }

    const props: {
        data: IService;
    } = defineProps({
        data: {
            type: Object as PropType<IService>,
        },
    });
</script>
<template>
    <div class="service-components section-margin-top" id="service">
        <div class="container">
            <div class="section-header">
                <h2 class="section-header__title">{{ props.data.title }}</h2>
            </div>
            <div class="service-components__body row q-gutter-md">
                <main-service-item v-for="(item, index) in props.data.fields" :key="'service-' + index" :data="item" />
            </div>
        </div>
    </div>
</template>

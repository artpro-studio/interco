<script lang="ts" setup>
    import {
        CreateReferenceBookInstancesDto,
        FullReferenceBookAttributesDto,
        getApiClientInitialParams,
        ReferenceBookAttributeControllerClient,
        ReferenceBookInstancesControllerClient,
    } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { onMounted, ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import FormButtons from '@/components/UI/FormButtons.vue';
    import { RouterName } from '@/router/routerName';
    import InstancesField from './components/InstancesField.vue';

    const route = useRoute();
    const router = useRouter();
    const { resultError } = useResultException();

    const isLoading = ref(true);
    const form = ref<CreateReferenceBookInstancesDto>({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
    });
    const attributes = ref<FullReferenceBookAttributesDto[]>([]);

    const getAttributes = async () => {
        const result = await new ReferenceBookAttributeControllerClient(getApiClientInitialParams()).get('', 1, 100, Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            attributes.value = result.entity?.entity || [];
        }
    };

    const onCreate = async () => {
        const result = await new ReferenceBookInstancesControllerClient(getApiClientInitialParams()).create(Number(route.params.id), form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            router.push({
                name: RouterName.ReferenceBookInstances,
                params: {
                    id: route.params.id,
                },
            });
        }
    };

    const onUpdate = async () => {
        const result = await new ReferenceBookInstancesControllerClient(getApiClientInitialParams()).update(Number(route.params.instancesId), form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            router.push({
                name: RouterName.ReferenceBookInstances,
                params: {
                    id: route.params.id,
                },
            });
        }
    };

    const onChange = async () => {
        if (form.value.id) {
            onUpdate();
        } else {
            onCreate();
        }
    };

    const getInfo = async () => {
        isLoading.value = true;
        const result = await new ReferenceBookInstancesControllerClient(getApiClientInitialParams()).getOne(Number(route.params.instancesId));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity as any;
        }
        isLoading.value = false;
    };

    onMounted(async () => {
        await getAttributes();

        if (route.name === RouterName.ReferenceBookInstancesEdit) {
            getInfo();
        } else {
            isLoading.value = false;
        }
    });
</script>
<template>
    <div class="q-pa-md flex flex-center" v-if="isLoading">
        <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
    </div>
    <q-card class="section-create-form" v-else>
        <q-card-section>
            <q-form ref="formRef" @submit="onChange">
                <div class="section-create-form__field q-mb-md" v-for="item in attributes" :key="item.id!">
                    <instances-field :value="form[item.slug]" :label="item.name" :type="item.type" @update:value="form[item.slug] = $event" />
                </div>
            </q-form>
            <form-buttons @success="onChange" />
        </q-card-section>
    </q-card>
</template>

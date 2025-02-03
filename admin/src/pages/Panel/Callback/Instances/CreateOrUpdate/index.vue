<script lang="ts" setup>
    import {
        CallbackFieldControllerClient,
        CallbackFieldDto,
        CallbackInstancesControllerClient,
        CreateCallbackInstancesDto,
        getApiClientInitialParams,
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

    const apiField = new CallbackFieldControllerClient(getApiClientInitialParams());
    const apiInstances = new CallbackInstancesControllerClient(getApiClientInitialParams());
    const isLoading = ref(true);
    const form = ref<CreateCallbackInstancesDto>({
        id: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        deletedAt: null,
    });
    const fields = ref<CallbackFieldDto[]>([]);

    const getAttributes = async () => {
        const result = await apiField.get('', 1, 100, Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            fields.value = result.entity?.entity || [];
        }
    };

    const onCreate = async () => {
        const result = await apiInstances.create(Number(route.params.id), form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            router.push({
                name: RouterName.CallbackInstances,
                params: {
                    id: route.params.id,
                },
            });
        }
    };

    const onUpdate = async () => {
        const result = await apiInstances.update(Number(route.params.instancesId), form.value);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            router.push({
                name: RouterName.CallbackInstances,
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
        const result = await apiInstances.getOne(Number(route.params.instancesId));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            form.value = result.entity as any;
        }
        isLoading.value = false;
    };

    onMounted(async () => {
        await getAttributes();

        if (route.name === RouterName.CallbackInstancesEdit) {
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
                <div class="section-create-form__field q-mb-md" v-for="item in fields" :key="item.id!">
                    <instances-field :value="form[item.attribute]" :label="item.name" :type="item.type" @update:value="form[item.attribute] = $event" />
                </div>
                <form-buttons />
            </q-form>
        </q-card-section>
    </q-card>
</template>

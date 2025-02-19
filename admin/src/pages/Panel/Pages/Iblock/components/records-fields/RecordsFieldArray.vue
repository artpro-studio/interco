<script lang="ts" setup>
    import { onBeforeMount, ref } from 'vue';

    interface IProps {
        field: Record<string, any>
    }
    const props = defineProps<IProps>();
    const emit = defineEmits(['on-change']);

    const form = ref<Record<string, any>[]>([]);
    let defoultField: any = [];

    /// Самый длинный массив
    function findKeyWithLongestArray(obj: any): string {
        let maxKey = '';
        let maxLength = 0;

        for (const key in obj) {
            if (Array.isArray(obj[key]) && obj[key].length > maxLength) {
                maxKey = key;
                maxLength = obj[key].length;
            }
        }

        return maxKey;
    }

    const onAddFileds = () => {
        form.value.push(JSON.parse(JSON.stringify(defoultField)));
    };

    const onRemove = (index: number) => {
        form.value.splice(index, 1);
    };

    const onUpdate = () => {
        const result: any = {};
        defoultField.forEach((el: any) => {
            result[el.lang] = {
                ...el
            };
        });
        form.value.forEach((el) => {
            el.forEach((item: any) => {
                result[item.lang].value += result[item.lang].value.length ? `;${item.value}` : item.value || ' ';
            });
        });
        console.log(result);
        emit('on-change', result);

    };

    onBeforeMount(() => {
        const arrayKey = [];
        const parseField: any = {};
        for (let key in props.field) {
            arrayKey.push(key);
            parseField[key] = props.field[key].value;
        }

        defoultField = arrayKey.map((el) => {
            return {
                lang: el,
                value: ''
            };
        });

        const maxLengthKey: string = findKeyWithLongestArray(parseField);
        const arrayValue: string[] = parseField[maxLengthKey];
        if (arrayValue.length) {
            const arrayNoMaxLength = arrayKey.filter((item: string) => item !== maxLengthKey);
            arrayValue.forEach((el: string, index: number) => {
                const result = [];
                result.push({
                    lang: maxLengthKey,
                    value: el.trim()
                });
                arrayNoMaxLength.forEach((key: string) => {
                    result.push({
                        lang: key,
                        value: parseField[key][index].trim()
                    });
                });
                form.value.push(result);
            });

        } else {
            form.value.push(JSON.parse(JSON.stringify(defoultField)));
        }
    });
</script>

<template>
    <div class="records-field-array">
        <div
            v-for="(arrayItem, arrayKey) in form"
            :key="arrayKey"
            class="records-field-array__body row no-wrap q-gutter-md q-mb-md items-center"
        >
            <div
                v-for="(item, itemKey) in arrayItem"
                class="records-field-array__item"
                :key="itemKey"
            >
                <q-input
                    v-model="item.value"
                    color="primary"
                    :label="item.lang"
                    @update:model-value="onUpdate"
                    outlined
                />
            </div>
            <q-btn icon="delete" class="records-field-array__delete" round size="sm" @click="onRemove(arrayKey)" />
        </div>
        <q-btn icon="add" round  @click="onAddFileds"/>
    </div>
</template>
<style lang="scss" scoped>
    .records-field-array {
        width: 100%;

        &__body {
            width: 100%;
        }
        &__item {
            min-width: calc(33.3333% - 26px);
            max-width: calc(33.3333% - 26px);
            width: calc(33.3333% - 26px);
        }

        &__delete {
            min-width: 30px;
            max-height: 30px;
        }
    }
</style>

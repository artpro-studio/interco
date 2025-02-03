import { Notify } from 'quasar';
import { useStore } from 'src/store';
import { Result } from './../ApiClient/ApiClient';

export default function useResultException() {
    const store = useStore();

    const resultError = (data: Result, errors: any | undefined | null) => {
        Notify.create({
            color: 'negative',
            textColor: 'white',
            icon: 'warning',
            message: data.message || 'Произошла ошибка',
        });
        if (errors && data.errors) {
            Object.keys(data.errors).forEach((key) => {
                errors[key] = data.errors[key].join(', ');
            });
        }

        if (data.status === 401) {
            store.commit('userModule/setToken', '');
            location.href = '/';
        }
    };

    return {
        resultError,
    };
}

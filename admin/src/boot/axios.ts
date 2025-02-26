import { boot } from 'quasar/wrappers';
import axios, { AxiosInstance } from 'axios';
//import qs from 'qs';

declare module '@vue/runtime-core' {
    interface ComponentCustomProperties {
        $axios: AxiosInstance;
    }
}

// const checkEmptyParams = (obj: any) => {
//     const clearObj: any = {};
//     Object.keys(obj).forEach((key) => {
//         if (String(obj[key]) == '[object Object]') {
//             const result = checkEmptyParams(obj[key]);
//             if (Object.keys(obj).length) {
//                 clearObj[key] = result;
//             }
//         } else if (Array.isArray(obj[key])) {
//             clearObj[key] = obj[key].filter((el: any) => {
//                 if (el) {
//                     return el;
//                 }
//             });
//         } else if (typeof obj[key] == 'boolean') {
//             clearObj[key] = obj[key];
//         } else {
//             clearObj[key] = obj[key] ? obj[key] : null;
//         }
//     });
//     return clearObj;
// };

// Be careful when using SSR for cross-request state pollution
// due to creating a Singleton instance here;
// If any client changes this (global) instance, it might be a
// good idea to move this instance creation inside of the
// "export default () => {}" function below (which runs individually
// for each client)

export default boot(({ app, store }) => {
    // for use inside Vue files (Options API) through this.$axios and this.$api
    console.log('test', import.meta.env.VITE_APP_BACKEND);
    const api = axios.create({
        baseURL: import.meta.env.VITE_APP_BACKEND,
        headers: {
            'Access-Control-Allow-Origin': '*',
        },
    });

    api.interceptors.request.use(async (configAxios) => {
        configAxios.headers.Authorization = `Bearer ${store.getters['authorizationModule/getToken']}`;
        return configAxios;
    });

    app.config.globalProperties.$axios = axios;
    // ^ ^ ^ this will allow you to use this.$axios (for Vue Options API form)
    //       so you won't necessarily have to import axios in each vue file

    app.config.globalProperties.$api = api;
    // ^ ^ ^ this will allow you to use this.$api (for Vue Options API form)
    //       so you can easily perform requests against your app's API
});

export { api };

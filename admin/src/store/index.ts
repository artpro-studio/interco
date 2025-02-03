import { store } from 'quasar/wrappers';
import { InjectionKey } from 'vue';
import { createStore, Store as VuexStore, useStore as vuexUseStore } from 'vuex';
import authorizationModule from './module-authorization';
import accountModule from './module-account';
import { AuthorizationStateInterface } from './module-authorization/state';
import { ModuleAccountStateInterface } from './module-account/state';
import VuexPersistence from 'vuex-persist';

/*
 * If not building with SSR mode, you can
 * directly export the Store instantiation;
 *
 * The function below can be async too; either use
 * async/await or return a Promise which resolves
 * with the Store instance.
 */

export interface StateInterface {
    // Define your own store structure, using submodules if needed
    // example: ExampleStateInterface;
    // Declared as unknown to avoid linting issue. Best to strongly type as per the line above.
    accountModule: ModuleAccountStateInterface;
    authorizationModule: AuthorizationStateInterface;
}

// provide typings for `this.$store`
declare module '@vue/runtime-core' {
    interface ComponentCustomProperties {
        $store: VuexStore<StateInterface>;
    }
}

// provide typings for `useStore` helper
export const storeKey: InjectionKey<VuexStore<StateInterface>> = Symbol('vuex-key');

// плагин vuex-persist позволяет хранить данные стора в localStorage.
// Здесь мы настраиваем храние данных модуля authorizationModule
// для того что бы там хранился JWT токен.
// Так же добавляем в localStorage информацию о состоянии чата (открыт, закрыт)
// И храним информацию о выбранных устройствах для звонка

// let storage: any = undefined;
// console.log(process.env.SERVER);
// if (!process.env.SERVER) {
//     storage = window.localStorage;
// }

const vuexLocal = new VuexPersistence<StateInterface>({
    storage: window.localStorage,
    reducer: (state) => ({
        authorizationModule: {
            token: state.authorizationModule.token,
        },
    }),
});

export default store(function () {
    const Store = createStore<StateInterface>({
        modules: {
            authorizationModule,
            accountModule,
        },
        plugins: [vuexLocal!.plugin],
        // enable strict mode (adds overhead!)
        // for dev mode and --debug builds only
        strict: !!process.env.DEBUGGING,
    });

    return Store;
});

export function useStore() {
    return vuexUseStore(storeKey);
}

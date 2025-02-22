import { store } from 'quasar/wrappers';
import { InjectionKey } from 'vue';
import { createStore, Store as VuexStore, useStore as vuexUseStore } from 'vuex';
import settingsModule from './module-settings';
import { ModuleSettingsStateInterface } from './module-settings/state';

export interface StateInterface {
  settingsModule: ModuleSettingsStateInterface;
}

// Создаем InjectionKey
export const storeKey: InjectionKey<VuexStore<StateInterface>> = Symbol('vuex-key');

const Store = createStore<StateInterface>({
  modules: {
    settingsModule,
  },
  strict: !!process.env.DEBUGGING,
});

export function useStore() {
  return vuexUseStore(storeKey);
}

export { Store };

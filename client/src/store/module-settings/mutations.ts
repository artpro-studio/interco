import { FullSettingsDto } from 'src/ApiClient/ApiClient';
import { MutationTree } from 'vuex';
import { ModuleSettingsStateInterface } from './state';

const mutation: MutationTree<ModuleSettingsStateInterface> = {
	// Добавить в стор информацию об аккаунте
    setSettings(state: ModuleSettingsStateInterface, payload: FullSettingsDto | null) {
        state.settings = payload;
    },
};

export default mutation;

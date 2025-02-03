import { FullUsersDto } from 'src/ApiClient/ApiClient';
import { MutationTree } from 'vuex';
import { ModuleAccountStateInterface } from './state';

const mutation: MutationTree<ModuleAccountStateInterface> = {
	// Добавить в стор информацию об аккаунте
    setAccountInfo(state: ModuleAccountStateInterface, payload: FullUsersDto | null) {
        state.accountInfo = payload;
    },
};

export default mutation;

import { AuthControllerClient, LoginDto, ResultLogin, FullUsersDto, getApiClientInitialParams} from 'src/ApiClient/ApiClient';
import { ActionTree, ActionContext } from 'vuex';
import { StateInterface } from '../index';
import { AuthorizationStateInterface } from './state';

const actions: ActionTree<AuthorizationStateInterface, StateInterface> = {

	async login({ commit }: ActionContext<AuthorizationStateInterface, StateInterface>, payload: LoginDto): Promise<FullUsersDto | null> {
        // Залогиниться в системе и получить токен
        const result: ResultLogin = await new AuthControllerClient(getApiClientInitialParams()).login(payload);

        if (result.entity.token) {
            commit('setToken', result.entity.token);
            return result.entity.entity;
        } else {
            return null;
        }
    },

	// Выйти из приложения
    logout({ commit }: ActionContext<AuthorizationStateInterface, StateInterface>) {
        commit('setToken', '');
    },
};

export default actions;

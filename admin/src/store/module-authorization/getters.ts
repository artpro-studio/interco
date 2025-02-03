import { GetterTree } from 'vuex';
import { StateInterface } from '../index';
import { AuthorizationStateInterface } from './state';

const getters: GetterTree<AuthorizationStateInterface, StateInterface> = {
	 // Залогинен ли пользователь
	 getIsLogged(state: AuthorizationStateInterface): boolean {
        return !!state.token;
    },
    // Получить токен авторизации
    getToken(state: AuthorizationStateInterface): string {
        return state.token;
    },
}; 

export default getters;

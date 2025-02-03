import { getApiClientInitialParams, UserControllerClient, ResultUserDto, UserDto } from 'src/ApiClient/ApiClient';
import { ActionTree, ActionContext } from 'vuex';
import { StateInterface } from '../index';
import { ModuleAccountStateInterface } from './state';

const actions: ActionTree<ModuleAccountStateInterface, StateInterface> = {
    // Получение информации о пользователе
    async getAccountInfo({
        commit,
    }: ActionContext<ModuleAccountStateInterface, StateInterface>): Promise<UserDto | null> {
        let accountInfo: UserDto | null = null;
        try {
            // Получение информации о текущем пользователе для отобра
            const result: ResultUserDto = await new UserControllerClient(getApiClientInitialParams()).getCurrentInfo();
            if (result.isSuccess) {
                accountInfo = result.entity;
                commit('setAccountInfo', accountInfo);
                return accountInfo;
            }
            return null;
        } catch (e) {
            console.log(e);
            return null;
        }
    },
};

export default actions;

import { FullUsersDto } from 'src/ApiClient/ApiClient';
import { GetterTree } from 'vuex';
import { StateInterface } from '../index';
import {  ModuleAccountStateInterface } from './state';

const getters: GetterTree<ModuleAccountStateInterface, StateInterface> = {
	accountInfo(state: ModuleAccountStateInterface): FullUsersDto | null {
		return state.accountInfo;
	}
}; 

export default getters;

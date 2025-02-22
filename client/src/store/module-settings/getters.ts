import { FullSettingsDto } from 'src/ApiClient/ApiClient';
import { GetterTree } from 'vuex';
import { StateInterface } from '../index';
import {  ModuleSettingsStateInterface } from './state';

const getters: GetterTree<ModuleSettingsStateInterface, StateInterface> = {
	getSettings(state: ModuleSettingsStateInterface): FullSettingsDto | null {
		return state.settings;
	}
};

export default getters;

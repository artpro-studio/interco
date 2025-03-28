import { Module } from 'vuex';
import { StateInterface } from '../index';
import state, { ModuleSettingsStateInterface } from './state';
import actions from './actions';
import getters from './getters';
import mutations from './mutations';

const settingsModule: Module<ModuleSettingsStateInterface, StateInterface> = {
	namespaced: true,
	actions,
	getters,
	mutations,
	state
};

export default settingsModule;

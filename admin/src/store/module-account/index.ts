import { Module } from 'vuex';
import { StateInterface } from '../index';
import state, { ModuleAccountStateInterface } from './state';
import actions from './actions';
import getters from './getters';
import mutations from './mutations';

const accountModule: Module<ModuleAccountStateInterface, StateInterface> = {
	namespaced: true,
	actions,
	getters,
	mutations, 
	state
};

export default accountModule;

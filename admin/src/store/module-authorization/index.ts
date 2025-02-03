import { Module } from 'vuex';
import { StateInterface } from '../index';
import state, { AuthorizationStateInterface } from './state';
import actions from './actions';
import getters from './getters';
import mutations from './mutations';

const authorizationModule: Module<AuthorizationStateInterface, StateInterface> = {
	namespaced: true,
	actions,
	getters,
	mutations, 
	state
};

export default authorizationModule;

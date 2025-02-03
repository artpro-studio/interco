import { MutationTree } from 'vuex';
import { AuthorizationStateInterface } from './state';

const mutation: MutationTree<AuthorizationStateInterface> = {
    setToken(state: AuthorizationStateInterface, token: string) {
        state.token = token;
    },
};

export default mutation;

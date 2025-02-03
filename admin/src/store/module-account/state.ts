import { FullUsersDto } from 'src/ApiClient/ApiClient';

export interface ModuleAccountStateInterface {
	accountInfo: FullUsersDto | null;
}

function state(): ModuleAccountStateInterface {
	return {
		accountInfo: null
	};
}
 
export default state;

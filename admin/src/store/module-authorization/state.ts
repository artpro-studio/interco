export interface AuthorizationStateInterface {
  token: string;
}

function state(): AuthorizationStateInterface {
	return {
		token: '',
	};
}
 
export default state;

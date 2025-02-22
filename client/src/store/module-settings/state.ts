import { FullSettingsDto } from 'src/ApiClient/ApiClient';

export interface ModuleSettingsStateInterface {
	settings: FullSettingsDto | null;
}

function state(): ModuleSettingsStateInterface {
	return {
		settings: null
	};
}

export default state;

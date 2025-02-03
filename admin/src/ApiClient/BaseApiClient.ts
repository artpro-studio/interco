import { useStore } from '../store';

export enum ITemplateComponentsType {
    TEXT = 'text',
    EDITOR = 'editor',
    TEXTAREA = 'textarea',
    FILE = 'file',
    IMAGE = 'image',
    GALLARY = 'gallary',
    COLOR = 'color',
    ARRAY = 'array',
}

export interface ITemplateComponentsField {
    type: ITemplateComponentsType;
    name: string;
    label: string;
    default: string;
    value?: string;
    fields?: ITemplateComponentsField[];
    defaultFields?: ITemplateComponentsField[];
    order?: number;
}
export interface ITemplateComponents {
    id?: number;
    name: string;
    title: string;
    icon: string;
    order?: number;
    fields: ITemplateComponentsField[];
    defaultFields?: ITemplateComponentsField[];
}

// класс BaseApiClient используется для генерации файла ApiClient.ts
export class BaseApiClient {
    private readonly config: ApiClientConfig;
    // AbortController используется для отмены асинхронных задач
    // в данном случае это будет fetch
    private abortController: AbortController = new AbortController();

    // на объекте abortController.signal генерируется событие abort
    private get abortSignal(): AbortSignal {
        return this.abortController.signal;
    }

    protected constructor(config: ApiClientConfig) {
        this.config = config;
    }

    // функция для отмены http запроса
    abortRequest() {
        this.abortController.abort();
    }

    // функция вызвается при каждом запросе
    transformOptions(options: RequestInit): Promise<RequestInit> {
        if (options && options.headers) {
            if (options.method && this.config && this.config.AntiforgeryToken) {
                const method = options.method.toUpperCase();
                if (method !== 'GET' && method !== 'HEAD' && method !== 'TRACE' && method !== 'OPTIONS') {
                    options.headers = {
                        ...options.headers,
                        RequestVerificationToken: this.config.AntiforgeryToken,
                    };
                }
            }
            if (this.config.AuthToken) {
                // добавление токена JWT в заголовок авторизации
                options.headers = {
                    ...options.headers,
                    Authorization: 'Bearer ' + this.config.AuthToken,
                };
            }
            // if (this.config.Lang) {
            //     // добавление заголовка с язкыом
            //     // используется для локализации приложения
            //     options.headers = {
            //         ...options.headers,
            //         'Accept-Language': this.config.Lang,
            //     };
            // }
        }

        if (options) {
            options.signal = this.abortSignal;
        }

        return Promise.resolve(options);
    }

    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    getBaseUrl(_1: string, baseUrl?: string): string {
        return getBaseApiUrl();
    }

    // вызывается при обработке результатов запроса
    transformResult(url: string, response: Response, callback: (_response: Response) => Promise<any>): Promise<any> {
        response.headers.forEach((value: string, key: string) => {
            if (key === 'set-cookie') {
                if (value.startsWith('.AspNetCore.Antiforgery')) {
                    const equalIndex = value.indexOf('=');
                    this.config.AntiforgeryToken = value.substring(equalIndex + 1);
                }
            }
        });

        if (response.status === 500) {
            //store.commit('mainLayoutModule/setVisibleSmthWentWrongBlock', true);
        }

        return callback(response);
    }
}

export class ApiClientConfig {
    public AntiforgeryToken: string | undefined = undefined;
    public AuthToken: string | undefined = undefined;
    // public Lang: string | undefined = undefined;
}

// Базовый url
export function getBaseApiUrl(): string {
    return 'http://localhost:3000';
}

// функция для получения данных
// для инициализации ApiClient'a
export function getApiClientInitialParams(): ApiClientConfig {
    const store = useStore();
    let token = '';
    if (store) {
        token = store.getters['authorizationModule/getToken'];
    } else if (localStorage.vuex) {
        const localStore = JSON.parse(localStorage.vuex);
        if (localStore.authorizationModule && localStore.authorizationModule.token) {
            token = localStore.authorizationModule.token;
        }
    }
    return {
        AntiforgeryToken: '',
        AuthToken: token,
    };
}

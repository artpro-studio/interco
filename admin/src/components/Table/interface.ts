export interface ITableAction {
    name: string;
    icon: string;
    action: (row?: any) => void;
    isView: boolean;
    onIsView?: (row?: any) => boolean;
}

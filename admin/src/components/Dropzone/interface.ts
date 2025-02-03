export interface IMockFile {
    fileId: number | null,
    secretKey: number | null,
    name: string,
    size: number,
    isDropzoneMockFile: boolean,
    status: string,
    accepted: boolean,
    noNeedDeleteFromServer: boolean
}

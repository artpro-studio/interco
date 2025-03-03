export enum TaskStatus {
    ACTIVE = 'active',
    ERROR = 'error',
    CANCEL = 'cancel',
    WAITING = 'waiting',
    COMPLETED = 'completed',
    FAILED = 'failed',
}
export enum TaskType {
    SendMessage = 'sendMessage',
    GenerateGraph = 'generateGraph',
    DeleteGraph = 'deleteGraph',
    UpdateGraph = 'updateGraph',
    ExportReports = 'exportReports',
    ExportReportsToEmail = 'exportReportsToEmail',
}

import { FileType } from 'src/ApiClient/ApiClient';

export interface ISearchLibrary {
    search: string | null;
    type: FileType | null;
}

export enum FileTypeName {
    images = 'Изоображение',
    file = 'Файл',
    pdf = 'PDF',
    audio = 'Аудио',
    video = 'Видео',
    docs = 'Документ',
    directory = 'Директория',
}

export interface IFileTypeArray {
    name: string;
    value: FileType;
}

export const fileTypeArray: IFileTypeArray[] = [
    {
        name: 'Изоображение',
        value: FileType.Images,
    },
    {
        name: 'Файл',
        value: FileType.File,
    },
    {
        name: 'PDF',
        value: FileType.Pdf,
    },
    {
        name: 'Аудио',
        value: FileType.Audio,
    },
    {
        name: 'Видео',
        value: FileType.Video,
    },
    {
        name: 'Документ',
        value: FileType.Docs,
    },
    {
        name: 'Директория',
        value: FileType.Directory,
    },
];

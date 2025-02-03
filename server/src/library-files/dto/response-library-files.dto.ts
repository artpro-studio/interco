import { ApiProperty } from '@nestjs/swagger';
import {CreateLibraryFilesDto} from './create-library-files.dto';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';

export class ResultLibraryFiles extends ResultDto {
    @ApiProperty({ type: () => [CreateLibraryFilesDto], nullable: true, description: 'Загруженый файл' })
    entity?: CreateLibraryFilesDto[];
}
export class ResponseLibraryFiles extends ResultDto {
    @ApiProperty({ type: () => CreateLibraryFilesDto, nullable: true, description: 'Загруженый файл' })
    entity?: CreateLibraryFilesDto;
}

export class ResponseLibraryFilesList extends ResultDto {
    @ApiProperty({ type: () => [CreateLibraryFilesDto], nullable: true, description: 'Загруженый файл' })
    entity?: CreateLibraryFilesDto[];
}

export class LibraryOption extends ResultPaginationOptionDto {
    @ApiProperty({ type: [CreateLibraryFilesDto], nullable: true, description: 'Список файлов' })
    entity: CreateLibraryFilesDto[];
}

export class ResponseLibraryListDto extends ResultDto {
    @ApiProperty({ type: LibraryOption, nullable: true, description: 'Ответ' })
    entity: LibraryOption;
}
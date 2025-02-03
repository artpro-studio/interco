import { FullSettingsDto } from './settings.dto';
import { ApiProperty } from '@nestjs/swagger';
import { ResultDto } from './../../dto/reponse.dto';

export class ResultSettingsDto extends ResultDto {
    @ApiProperty({ type: () => FullSettingsDto, nullable: true, description: 'Ответ'})
    entity: FullSettingsDto;
}
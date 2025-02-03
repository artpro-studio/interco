import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from './base.dto';

export class BaseSeoDto extends DefaultBaseDto {
  @ApiProperty({ nullable: true, example: 'Seo title' })
  seoTitle: string;

  @ApiProperty({ nullable: true, example: 'Seo description' })
  seoDescription: string;

  @ApiProperty({ nullable: true, example: 'Seo keywords' })
  seoKeywords: string;
}

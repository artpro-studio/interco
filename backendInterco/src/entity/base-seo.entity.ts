import { ApiProperty } from '@nestjs/swagger';
import { Column } from 'typeorm';
import { DefaultBaseEntity } from './base.entity';

export class BaseSeoEntity extends DefaultBaseEntity {
  @ApiProperty({ nullable: true, example: 'Seo title' })
  @Column({ nullable: true, default: '', length: 1024 })
  seoTitle: string;

  @ApiProperty({ nullable: true, example: 'Seo description' })
  @Column({ nullable: true, default: '', length: 2048 })
  seoDescription: string;

  @ApiProperty({ nullable: true, example: 'Seo keywords' })
  @Column({ nullable: true, default: '', length: 2048 })
  seoKeywords: string;
}

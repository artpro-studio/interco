import { ApiProperty } from '@nestjs/swagger';
import {
  CreateDateColumn,
  DeleteDateColumn,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

export class DefaultBaseEntity {
  @ApiProperty({ example: 1, required: false, nullable: true })
  @PrimaryGeneratedColumn()
  id: number;

  @ApiProperty({ example: '2023-01-01T00:00:00', required: false, nullable: false })
  @CreateDateColumn({ default: new Date(), nullable: false })
  createdAt?: Date;

  @ApiProperty({ example: '2023-01-01T00:00:00', required: false, nullable: false })
  @UpdateDateColumn({ default: new Date(), nullable: false })
  updatedAt?: Date;

  @ApiProperty({ example: '2023-01-01T00:00:00', required: false, nullable: false })
  @DeleteDateColumn({ default: null, nullable: true })
  deletedAt?: Date;
}

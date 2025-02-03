import { ApiProperty } from '@nestjs/swagger';

export class DefaultBaseDto {
  @ApiProperty({ example: 1, nullable: true })
  readonly id!: number;

  @ApiProperty({ example: '2023-01-01T00:00:00', nullable: true })
  readonly createdAt: Date;

  @ApiProperty({ example: '2023-01-01T00:00:00', nullable: true })
  readonly updatedAt: Date;

  @ApiProperty({ example: '2023-01-01T00:00:00', nullable: true })
  readonly deletedAt: Date;
}

import { ApiProperty } from '@nestjs/swagger';

export class DefaultBaseDto {
  @ApiProperty({ example: 1, nullable: true, required: false, })
  readonly id?: number;

  @ApiProperty({ example: '2023-01-01T00:00:00', nullable: true, required: false, })
  readonly createdAt?: Date;

  @ApiProperty({ example: '2023-01-01T00:00:00', nullable: true, required: false, })
  readonly updatedAt?: Date;

  @ApiProperty({ example: '2023-01-01T00:00:00', nullable: true, required: false, })
  readonly deletedAt?: Date;
}

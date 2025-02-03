import { Test, TestingModule } from '@nestjs/testing';
import { ReferenceBookController } from './controller/reference-book.controller';
import { ReferenceBookService } from './service/reference-book.service';

describe('ReferenceBookController', () => {
  let controller: ReferenceBookController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ReferenceBookController],
      providers: [ReferenceBookService],
    }).compile();

    controller = module.get<ReferenceBookController>(ReferenceBookController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});

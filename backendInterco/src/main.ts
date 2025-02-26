import { HttpAdapterHost, NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { HttpExceptionFilter } from './filter/http-exception.filter';
import { useContainer } from 'class-validator';
import { NestExpressApplication } from '@nestjs/platform-express';
import { join } from 'path';
import { ValidationPipe } from './pipes/validation.pipe';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  const httpAdapter = app.get(HttpAdapterHost);
  app.setGlobalPrefix('api');
  app.enableCors({
    origin: [
        'http://localhost:9002',
        'http://localhost:9003',
        'http://localhost:9150',
        'http://admin.andreyi96.beget.tech',
        'http://interco.andreyi96.beget.tech',
      ],
  });
  app.useGlobalFilters(new HttpExceptionFilter(httpAdapter));
  app.useStaticAssets(join(__dirname, '../', 'public'));
  app.useGlobalPipes(new ValidationPipe());
  useContainer(app.select(AppModule), { fallbackOnErrors: true });

  const config = new DocumentBuilder()
    .setTitle('Cms')
    .setDescription('The cms API')
    .setVersion('1.0')
    .addTag('cms')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  await app.listen(3000);
}
bootstrap();

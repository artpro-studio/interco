import { ConfigModule } from '@nestjs/config';
import { EjsAdapter } from '@nestjs-modules/mailer/dist/adapters/ejs.adapter';
import { Module } from '@nestjs/common';
import { NodeMailerService } from './node-mailer.service';
import { NodeMailerController } from './node-mailer.controller';
import { MailerModule } from '@nestjs-modules/mailer';

@Module({
  controllers: [NodeMailerController],
  providers: [NodeMailerService],
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    MailerModule.forRoot({
      transport: {
        host: process.env.SMTP_HOST,
        port: process.env.SMTP_PORT,
        secure: true, // upgrade later with STARTTLS
        auth: {
          user: process.env.SMTP_USER,
          pass: process.env.SMTP_PASSWORD,
        },
      },
      defaults: {
        from: process.env.SMTP_USER,
      },
      template: {
        adapter: new EjsAdapter(),
        options: {
          strict: false,
        },
      },
    }),
  ],
  exports: [NodeMailerService]
})
export class NodeMailerModule {}

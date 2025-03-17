import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import axios from 'axios';

@Injectable()
export class CaptchaService {
    private readonly SECRET_KEY = process.env.SECRET_KEY_CAPTCHA;

    async verifyCaptcha(token: string): Promise<boolean> {
        const url = 'https://challenges.cloudflare.com/turnstile/v0/siteverify';
        try {
            const { data } = await axios.post(
                url,
                new URLSearchParams({
                    secret: this.SECRET_KEY,
                    response: token,
                }).toString(),
                {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                }
            );

            if (!data.success) {
                // throw new HttpException(
                //     'Captcha verification failed',
                //     HttpStatus.FORBIDDEN
                // );
                return false;
            }

            return true;
        } catch (error) {
            // throw new HttpException(
            //     'Captcha validation error',
            //     HttpStatus.BAD_REQUEST
            // );
            return false;
        }
    }
}

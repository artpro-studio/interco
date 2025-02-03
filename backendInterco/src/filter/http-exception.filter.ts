import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  HttpException,
  HttpStatus,
  NotFoundException,
} from '@nestjs/common';
import { HttpAdapterHost } from '@nestjs/core';

export function messageStatusCode(status: number): string {
  switch (status) {
    case 500:
      return 'Сервер упал в ошибку при обработке запроса';
    case 501:
      return 'Запрос не может быть обработан';
    case 502:
      return 'Запрос не обработан, плохое соединение';
    case 503:
      return 'Сервер не доступен';
    case 504:
      return 'Время выполнения закончилось или сервер не доступен';
    case 505:
      return 'Такой запрос не поддерживается сервером';
    case 400:
      return 'Запрос не выполнен, произошла ошибка';
    case 401:
      return 'Вы не авторизованы';
    case 403:
      return 'Нет доступа';
    case 404:
      return 'Ничего не найдено по вашему запросу';
    case 405:
      return 'Запрос не разрещен, у вас нет доступа';
    case 406:
      return 'Не найден контент по вашему запросу';
    case 408:
      return 'Время выполнения закончилось или сервер не доступен';
    case 409:
      return 'Конфликт сервера с текущим состоянием';

    default: {
      return 'Ошибка сервера';
    }
  }
}


@Catch()
export class HttpExceptionFilter implements ExceptionFilter {
  constructor(private readonly httpAdapterHost: HttpAdapterHost) {}
  catch(exception: any, host: ArgumentsHost): void {
    // In certain situations `httpAdapter` might not be available in the
    // constructor method, thus we should resolve it here.
    const { httpAdapter } = this.httpAdapterHost;
    const ctx = host.switchToHttp();
    const httpStatus = exception instanceof HttpException ? exception.getStatus() : HttpStatus.INTERNAL_SERVER_ERROR;
    const responseBody = {
      isSuccess: false,
      status: httpStatus,
      message: exception && exception.response && exception.response.messages ? exception.response.messages.join(', '): messageStatusCode(httpStatus),
      errors: exception && exception.response ? exception.response.arrErrors : undefined
    };

    httpAdapter.reply(ctx.getResponse(), responseBody, httpStatus);
  }
}

//   catch(error: any, host: ArgumentsHost) {
//     const ctx = host.switchToHttp();
//     const res = ctx.getResponse();
//     const req = ctx.getRequest();

//     if (error.getStatus() === HttpStatus.UNAUTHORIZED) {
//         if (typeof error.response !== 'string') {
//             error.response['message'] =
//                 error.response.message || 'You do not have permission to access this resource';
//         }
//     }

//     res.status(error.getStatus()).json({
//         statusCode: error.getStatus(),
//         error: error.response.name || error.name,
//         message: error.response.message || error.message,
//         errors: error.response.errors || null,
//         timestamp: new Date().toISOString(),
//         path: req ? req.url : null,
//     });
// }

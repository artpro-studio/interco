import { ResultDto } from './../dto/reponse.dto';
import { ApiUnauthorizedResponse, ApiInternalServerErrorResponse, ApiNoContentResponse, ApiBadRequestResponse, ApiNotFoundResponse, ApiBadGatewayResponse, ApiConflictResponse, ApiForbiddenResponse, ApiGatewayTimeoutResponse, ApiMethodNotAllowedResponse, ApiNotAcceptableResponse, ApiRequestTimeoutResponse, ApiResponse } from '@nestjs/swagger';
import { applyDecorators } from '@nestjs/common';

export const ApiExceptionDecorators = () => {
    return applyDecorators(
        ApiUnauthorizedResponse({type: ResultDto, description: 'Вы не авторизованы' }),
        ApiInternalServerErrorResponse({status: 500, type: ResultDto, description: 'Сервер упал в ошибку при обработке запроса'}),
        ApiNoContentResponse({ type: ResultDto, description: 'Нет данных'}),
        ApiBadRequestResponse({ type: ResultDto, description: 'Запрос не выполнен, произошла ошибка'}),
        ApiNotFoundResponse({ type: ResultDto, description: 'Ничего не найдено по вашему запросу'}),
        ApiBadGatewayResponse({ type: ResultDto, description: 'Запрос не обработан, плохое соединение'}),
        ApiConflictResponse({ type: ResultDto, description: 'Конфликт сервера с текущим состоянием'}),
        ApiForbiddenResponse({ type: ResultDto, description: 'Нет доступа'}),
        ApiGatewayTimeoutResponse({ type: ResultDto, description: 'Время выполнения закончилось или сервер не доступена'}),
        ApiMethodNotAllowedResponse({ type: ResultDto, description: 'Запрос не разрещен, у вас нет доступа'}),
        ApiNotAcceptableResponse({ type: ResultDto, description: 'Не найден контент по вашему запросу'}),
        ApiRequestTimeoutResponse({ type: ResultDto, description: 'Время выполнения закончилось или сервер не доступен'})
    );
  };

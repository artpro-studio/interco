import { Role } from './../user/role-interface';
import { AuthService } from 'src/auth/auth.service';
  import {
    ExecutionContext,
    Injectable,
    UnauthorizedException,
  } from '@nestjs/common';
  import { AuthGuard } from '@nestjs/passport';
  
  @Injectable()
  export class JwtAuthGuardAdmin extends AuthGuard('jwt') {
    constructor(private authService: AuthService) {
      super();
    }
  
    canActivate(context: ExecutionContext) {
      // Add your custom authentication logic here
      // for example, call super.logIn(request) to establish a session.
      // const req = context.switchToHttp().getRequest();
      // const authHeader = req.headers.authorization;
      // const token = authHeader.split(' ')[1];
      return super.canActivate(context);
    }
  
    handleRequest(err, user, info) {
      // You can throw an exception based on either "info" or "err" arguments
      if (err || !user || user.role !== Role.Admin) {
        throw err || new UnauthorizedException({
            message: 'Вы не авторизованы, или у вас не прав',
            status: 200,
            isSuccess: false
        });
      }

      return user;
    }
  }
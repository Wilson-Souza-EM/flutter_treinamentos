import 'package:dartz/dartz.dart';
import 'package:flutter_treinamento/domain/entities/login.dart';
import 'package:flutter_treinamento/domain/error/failure.dart';
import 'package:flutter_treinamento/domain/services/login_service.dart';

class LoginUseCase{
  final LoginService loginService;

  LoginUseCase({required this.loginService});

  Future<Either<Failure, Login>> realizeLogin({required String usuario, required String senha}) async {
    if(usuario.isEmpty || senha.isEmpty)
    {
      return Left(ErrorLogin(mensagem: 'Informe login e senha'));
    }
    var login = await loginService.obtenhaLogin(usuario: usuario, senha: senha);
    return Right(login);
  }
}
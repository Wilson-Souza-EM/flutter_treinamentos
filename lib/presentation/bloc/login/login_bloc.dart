import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_treinamento/domain/entities/login.dart';
import 'package:flutter_treinamento/domain/error/failure.dart';
import 'package:flutter_treinamento/domain/usecases/login_usecase.dart';
import 'package:flutter_treinamento/presentation/bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginState.inicializando());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPressedButtonEvent) {
      yield LoginState.carregando();

      Either<Failure, Login> result =
      await loginUseCase.realizeLogin(usuario: event.usuario, senha: event.senha);

      yield result.fold(
              (failure) => LoginState.erro(failure.mensagem),
              (sucess) => LoginState.sucesso(sucess.token));
    }
  }
}
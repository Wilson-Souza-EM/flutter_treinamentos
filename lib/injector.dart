import 'package:flutter_treinamento/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/services/login_service_impl.dart';
import 'domain/services/login_service.dart';
import 'domain/usecases/login_usecase.dart';

final getIt = GetIt.instance;

Future<void> init() async{
  getIt.registerFactory(() => LoginBloc(loginUseCase: getIt()));
  getIt.registerFactory(() => LoginUseCase(loginService: getIt()));


  getIt.registerFactory<LoginService>(() => LoginServiceImpl());
}
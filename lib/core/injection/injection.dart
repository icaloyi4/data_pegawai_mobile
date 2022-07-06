import 'package:clean_architecture_null_safety/core/remote/dio_module.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

part 'injection.g.dart';

abstract class Injection {
  @Register.singleton(Dio, from: DioModule)
  //OFFLINE MODE
  // @Register.singleton(DatabaseModule)
  // @Register.singleton(HCSSODao, resolvers: {DatabaseModule: null})

  //BLOC
  // @Register.singleton(FCMInit, resolvers: {HCSSODao: null, HomeBloc: null})
  // @Register.singleton(OneSignalInit, resolvers: {HCSSODao: null, HomeBloc: null})

  //Login
  // @Register.singleton(LoginRemoteSource, resolvers: {Dio: null})
  // @Register.singleton(LoginLocalSource, resolvers: {HrisDao: null})
  // @Register.singleton(LoginRepository,
  //     from: LoginRepositoryImpl,
  //     resolvers: {LoginRemoteSource: null, LoginLocalSource: null})
  // @Register.factory(LoginBloc, resolvers: {LoginRepository: null})

  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}

import 'package:ojrek_hris/core/remote/dio_module.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

import '../../features/login_page/bloc/login_bloc.dart';
import '../../features/login_page/data/local/login_local_source.dart';
import '../../features/login_page/data/remote/login_remote_source.dart';
import '../../features/login_page/domain/repository/login_repository.dart';
import '../../features/login_page/domain/repository/login_repository_impl.dart';


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
  @Register.singleton(LoginRemoteSource, resolvers: {Dio: ""})
  @Register.singleton(LoginLocalSource)
  @Register.singleton(LoginRepository,
      from: LoginRepositoryImpl,
      resolvers: {LoginRemoteSource: "", LoginLocalSource: ""})
  @Register.factory(LoginBloc, resolvers: {LoginRepository: ""})
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}

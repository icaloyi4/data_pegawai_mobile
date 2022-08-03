import 'package:ojrek_hris/core/remote/dio_module.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import '../../features/admin_features/crud_department_page/bloc/crud_department_bloc.dart';
import '../../features/admin_features/crud_department_page/data/local/crud_department_local_source.dart';
import '../../features/admin_features/crud_department_page/data/remote/crud_department_remote_source.dart';
import '../../features/admin_features/crud_department_page/domain/repository/crud_department_repository.dart';
import '../../features/admin_features/crud_department_page/domain/repository/crud_department_repository_impl.dart';
import '../../features/admin_features/crud_user_page/bloc/crud_user_bloc.dart';
import '../../features/admin_features/crud_user_page/data/local/crud_user_local_source.dart';
import '../../features/admin_features/crud_user_page/data/remote/crud_user_remote_source.dart';
import '../../features/admin_features/crud_user_page/domain/repository/crud_user_repository.dart';
import '../../features/admin_features/crud_user_page/domain/repository/crud_user_repository_impl.dart';
import '../../features/home_page/bloc/home_bloc.dart';
import '../../features/home_page/data/local/home_local_source.dart';
import '../../features/home_page/data/remote/home_remote_source.dart';
import '../../features/home_page/domain/repository/home_repository.dart';
import '../../features/home_page/domain/repository/home_repository_impl.dart';
import '../../features/register_page/bloc/register_bloc.dart';
import '../../features/register_page/data/local/register_local_source.dart';
import '../../features/register_page/domain/repository/register_repository.dart';
import '../../features/register_page/domain/repository/register_repository_impl.dart';
import '../../features/register_page/data/remote/register_remote_source.dart';

import '../../features/login_page/bloc/login_bloc.dart';
import '../../features/login_page/data/local/login_local_source.dart';
import '../../features/login_page/data/remote/login_remote_source.dart';
import '../../features/login_page/domain/repository/login_repository.dart';
import '../../features/login_page/domain/repository/login_repository_impl.dart';
import '../../features/user_page/bloc/user_bloc.dart';
import '../../features/user_page/data/local/user_local_source.dart';
import '../../features/user_page/data/remote/user_remote_source.dart';
import '../../features/user_page/domain/repository/user_repository.dart';
import '../../features/user_page/domain/repository/user_repository_impl.dart';


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

  //Login
  @Register.singleton(RegisterRemoteSource, resolvers: {Dio: ""})
  @Register.singleton(RegisterLocalSource)
  @Register.singleton(RegisterRepository,
      from: RegisterRepositoryImpl,
      resolvers: {RegisterRemoteSource: "", RegisterLocalSource: ""})
  @Register.factory(RegisterBloc, resolvers: {RegisterRepository: ""})

  //User
  @Register.singleton(UserRemoteSource, resolvers: {Dio: ""})
  @Register.singleton(UserLocalSource)
  @Register.singleton(UserRepository,
      from: UserRepositoryImpl,
      resolvers: {UserRemoteSource: "", UserLocalSource: ""})
  @Register.factory(UserBloc, resolvers: {UserRepository: ""})

  //Home
  @Register.singleton(HomeRemoteSource, resolvers: {Dio: ""})
  @Register.singleton(HomeLocalSource)
  @Register.singleton(HomeRepository,
      from: HomeRepositoryImpl,
      resolvers: {HomeRemoteSource: "", HomeLocalSource: ""})
  @Register.factory(HomeBloc, resolvers: {HomeRepository: ""})

  //CRUD USER
  @Register.singleton(CrudUserRemoteSource, resolvers: {Dio: ""})
  @Register.singleton(CrudUserLocalSource)
  @Register.singleton(CrudUserRepository,
      from: CrudUserRepositoryImpl,
      resolvers: {CrudUserRemoteSource: "", CrudUserLocalSource: ""})
  @Register.factory(CrudUserBloc, resolvers: {CrudUserRepository: ""})

  //CRUD USER
  @Register.singleton(CrudDepartmentRemoteSource, resolvers: {Dio: ""})
  @Register.singleton(CrudDepartmentLocalSource)
  @Register.singleton(CrudDepartmentRepository,
      from: CrudDepartmentRepositoryImpl,
      resolvers: {CrudDepartmentRemoteSource: "", CrudDepartmentLocalSource: ""})
  @Register.factory(CrudDepartmentBloc, resolvers: {CrudDepartmentRepository: ""})
  
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}

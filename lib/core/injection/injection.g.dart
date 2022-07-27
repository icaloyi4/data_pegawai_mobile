// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injection extends Injection {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<Dio>((c) => DioModule())
      ..registerSingleton((c) => LoginRemoteSource(c<Dio>()))
      ..registerSingleton((c) => LoginLocalSource())
      ..registerSingleton<LoginRepository>((c) =>
          LoginRepositoryImpl(c<LoginRemoteSource>(), c<LoginLocalSource>()))
      ..registerFactory((c) => LoginBloc(c<LoginRepository>()))
      ..registerSingleton((c) => RegisterRemoteSource(c<Dio>()))
      ..registerSingleton((c) => RegisterLocalSource())
      ..registerSingleton<RegisterRepository>((c) => RegisterRepositoryImpl(
          c<RegisterRemoteSource>(), c<RegisterLocalSource>()))
      ..registerFactory((c) => RegisterBloc(c<RegisterRepository>()))
      ..registerSingleton((c) => UserRemoteSource(c<Dio>()))
      ..registerSingleton((c) => UserLocalSource())
      ..registerSingleton<UserRepository>((c) =>
          UserRepositoryImpl(c<UserRemoteSource>(), c<UserLocalSource>()))
      ..registerFactory((c) => UserBloc(c<UserRepository>()))
      ..registerSingleton((c) => HomeRemoteSource(c<Dio>()))
      ..registerSingleton((c) => HomeLocalSource())
      ..registerSingleton<HomeRepository>((c) =>
          HomeRepositoryImpl(c<HomeRemoteSource>(), c<HomeLocalSource>()))
      ..registerFactory((c) => HomeBloc(c<HomeRepository>()));
  }
}

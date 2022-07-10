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
      ..registerSingleton<LoginRepository>((c) => LoginRepositoryImpl(
          c<LoginRemoteSource>(), c<LoginLocalSource>()))
      ..registerFactory((c) => LoginBloc(c<LoginRepository>()));
  }
}

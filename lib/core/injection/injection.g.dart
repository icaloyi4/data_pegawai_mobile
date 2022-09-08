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
      ..registerFactory((c) => HomeBloc(c<HomeRepository>()))
      ..registerSingleton((c) => CrudUserRemoteSource(c<Dio>()))
      ..registerSingleton((c) => CrudUserLocalSource())
      ..registerSingleton<CrudUserRepository>((c) => CrudUserRepositoryImpl(
          c<CrudUserRemoteSource>(), c<CrudUserLocalSource>()))
      ..registerFactory((c) => CrudUserBloc(c<CrudUserRepository>()))
      ..registerSingleton((c) => CrudDepartmentRemoteSource(c<Dio>()))
      ..registerSingleton((c) => CrudDepartmentLocalSource())
      ..registerSingleton<CrudDepartmentRepository>((c) =>
          CrudDepartmentRepositoryImpl(
              c<CrudDepartmentRemoteSource>(), c<CrudDepartmentLocalSource>()))
      ..registerFactory(
          (c) => CrudDepartmentBloc(c<CrudDepartmentRepository>()))
      ..registerSingleton((c) => CrudCompanyRemoteSource(c<Dio>()))
      ..registerSingleton((c) => CrudCompanyLocalSource())
      ..registerSingleton<CrudCompanyRepository>((c) =>
          CrudCompanyRepositoryImpl(
              c<CrudCompanyRemoteSource>(), c<CrudCompanyLocalSource>()))
      ..registerFactory((c) => CrudCompanyBloc(c<CrudCompanyRepository>()))
      ..registerSingleton((c) => CrudNewsRemoteSource(c<Dio>()))
      ..registerSingleton((c) => CrudNewsLocalSource())
      ..registerSingleton<CrudNewsRepository>((c) => CrudNewsRepositoryImpl(
          c<CrudNewsRemoteSource>(), c<CrudNewsLocalSource>()))
      ..registerFactory((c) => CrudNewsBloc(c<CrudNewsRepository>()))
      ..registerSingleton((c) => CrudAnnouncementRemoteSource(c<Dio>()))
      ..registerSingleton((c) => CrudAnnouncementLocalSource())
      ..registerSingleton<CrudAnnouncementRepository>((c) =>
          CrudAnnouncementRepositoryImpl(c<CrudAnnouncementRemoteSource>(),
              c<CrudAnnouncementLocalSource>()))
      ..registerFactory(
          (c) => CrudAnnouncementBloc(c<CrudAnnouncementRepository>()))
      ..registerSingleton((c) => AttendanceRemoteSource(c<Dio>()))
      ..registerSingleton((c) => AttendanceLocalSource())
      ..registerSingleton<AttendanceRepository>((c) => AttendanceRepositoryImpl(
          c<AttendanceRemoteSource>(), c<AttendanceLocalSource>()))
      ..registerFactory((c) => AttendanceBloc(c<AttendanceRepository>()));
  }
}

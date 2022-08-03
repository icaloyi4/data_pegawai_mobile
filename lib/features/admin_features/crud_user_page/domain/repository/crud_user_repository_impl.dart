import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_department_position_response.dart'
    as dept;
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart'
    as usr;

import '../../../../user_page/bloc/user_bloc.dart';
import '../../data/local/crud_user_local_source.dart';
import '../../data/remote/crud_user_remote_source.dart';
import '../../data/remote/get_user_response.dart';
import 'crud_user_repository.dart';

class CrudUserRepositoryImpl implements CrudUserRepository {
  final CrudUserRemoteSource _remoteSource;
  final CrudUserLocalSource _localSource;

  CrudUserRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> getDataUser(
      {Function(List<usr.DataUserRegister> user)? onSuccess,
      Function(String message, int code)? onError}) async {
    try {
      var response = await _remoteSource.getUser();
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess!(response.body!.data);
      } else {
        onError!(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError!("Internal Server Error", 500);
    }
  }

  @override
  Future<void> getDepartmenPosition(
      {Function(List<dept.Data> user)? onSuccess,
      Function(String message, int code)? onError}) async {
    try {
      var response = await _remoteSource.getDeptPos();
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        if (response.body?.data != null) {
          onSuccess!(response.body!.data!);
        }
      } else {
        onError!(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError!("Internal Server Error", 500);
    }
  }

  @override
  Future<void> registerUser(DataUserRegister userInputModel, bool isUpdate,
      {Function()? onSuccess,
      Function(String message, int code)? onError}) async {
    try {
      var response = await _remoteSource.regisUser(userInputModel, isUpdate);
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess!();
      } else {
        onError!(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError!("Internal Server Error", 500);
    }
  }

  @override
  Future<void> deleteUser(int idUser,
      {Function()? onSuccess,
      Function(String message, int code)? onError}) async {
    try {
      var response = await _remoteSource.deleteUser(idUser);
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess!();
      } else {
        onError!(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError!("Internal Server Error", 500);
    }
  }
}

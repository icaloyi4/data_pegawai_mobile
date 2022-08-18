import '../../features/user_page/bloc/user_bloc.dart';

class BaseRemoteRepository {
  void responseProcess(
    response,
    Function onSuccess,
    Function onError,
  ) {
    try {
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess(response.body?.data);
      } else {
        onError(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError("Internal Server Error", 500);
    }
  }

  void responseWithoutLogoutProcess(
    response,
    Function onSuccess,
    Function onError,
  ) {
    try {
      if (response.body?.code == 200) {
        onSuccess(response.body?.data);
      } else {
        onError(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError("Internal Server Error", 500);
    }
  }
}

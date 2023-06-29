import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/core/utlis.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

// <int> là một tham số kiểu được sử dụng để chỉ định kiểu dữ liệu mà StateNotifier sẽ lưu trữ và quản lý.
class AuthController extends StateNotifier<bool> {
  AuthController({required AuthAPI authAPI})
      : _authApi = authAPI,
        super(false);
  final AuthAPI _authApi;
  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authApi.signUp(email: email, password: password);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => debugPrint(r.email),
    );
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authApi.login(
      email: email,
      password: password,
    );
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) => print(r.userId));
  }
}

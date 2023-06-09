import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/apis/user_api.dart';
import 'package:twitter_clone/core/utlis.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/home/view/home_view.dart';
import 'package:twitter_clone/models/user_model.dart';

import 'package:appwrite/models.dart' as model;
import 'package:flutter/material.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
  ref.watch(authAPIProvider),
   ref.watch(userAPIProvider),
  );
});
// final currentUserDetailsProvider = FutureProvider((ref) {
//   final currentUserId = ref.watch(currentUserAccountProvider).value!.$id;
//   final userDetails = ref.watch(userDetailsProvider(currentUserId));
//   return userDetails.value;
// });

// final userDetailsProvider = FutureProvider.family((ref, String uid) {
//   final authController = ref.watch(authControllerProvider.notifier);
//   return authController.get(uid);
// });

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

// <int> là một tham số kiểu được sử dụng để chỉ định kiểu dữ liệu mà StateNotifier sẽ lưu trữ và quản lý.
class AuthController extends StateNotifier<bool> {
  AuthController( authAPI, UserAPI userAPI)
      : _authApi = authAPI,
        _userAPI = userAPI,
        super(false);
  final AuthAPI _authApi;
  final UserAPI _userAPI;

  Future<model.Account?> currentUser() => _authApi.currentUserAccount();

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
      (r) {
        showSnackBar(context, "Account created successfully! Please login");
        Navigator.push(context, LoginView.route());
      },
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
    res.fold((l) => showSnackBar(context, l.message), (r) {
      Navigator.push(context, HomeView.route());
    });
  }

  Future<UserModel> getUserData(String uid) async {
    final document = await _userAPI.getUserData(uid);
    final updatedUser = UserModel.fromMap(document.data);
    return updatedUser;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/core/providers.dart';

// inject the dependencies form another provider
final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

//  want to sign up, get user account => Account
// want to access user related data ->model.account
abstract class IAuthAPI {
  // void signup();

  FutureEither<model.Account> signUp(
      {required String email, required String password});
  FutureEither<model.Session> login();
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  // AuthAPI({
  // required Account account,
  // }) : _account = account;
  AuthAPI({
    required Account account,
  }) : _account = account;
// Khi khởi tạo đối tượng AuthAPI,
  // Phần :_account=account có nghĩa là khi một đối tượng AuthAPI được khởi tạo,
  // thuộc tính _account sẽ được khởi tạo với giá trị của tham số account.
  @override
  FutureEither<model.Account> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? "some unexcepted error occured", stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/theme.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  Future<String> getIPAddress() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          return addr.address;
        }
      }
    }
    return 'Unknown';
  }

  final appBar = UIConstants.appBar();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appBar,
      body: loading == true
          ? const LoadingPage()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      //TextField1
                      AuthField(
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AuthField(
                        controller: passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: RoundedSmallButton(
                          onTap: () {
                            var x = getIPAddress();
                            print(AppWriteConstants.endPoint);
                            print(x.then((value) => debugPrint(value)));
                            onSignUp();
                          },
                          label: 'Done',
                          backgroundColor: Pallete.blueColor,
                          textColor: Pallete.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text.rich(
                        TextSpan(
                          children: const [
                            TextSpan(
                              text: ' Login',
                              style: TextStyle(
                                color: Pallete.blueColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                          text: "Don't have a account",
                          style: const TextStyle(
                            color: Pallete.whiteColor,
                            fontSize: 16,
                          ),
                          // Trong đoạn mã này, khi người dùng thực hiện một hành động nhấn và nhả trên widget
                          //được gắn với TapGestureRecognizer, hàm được gán cho onTap sẽ được gọi.
                          //Bạn có thể thay đổi nội dung của hàm này để thực hiện các hành động
                          //cụ thể mong muốn khi người dùng
                          //thực hiện hành động nhấn và nhả trên widget tương ứng. Ví dụ:
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginView(),
                                ),
                              );
                            },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

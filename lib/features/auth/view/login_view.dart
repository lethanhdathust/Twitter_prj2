import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart ';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/common/rounded_small_button.dart';
import 'package:twitter_clone/constants/uiconstants.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/theme.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  //We want the appbar doesnot rebuild even during the oading indicator
  //So we have final appbar, when have a rebuild it doesnot call the function again
  final appBar = UIConstants.appBar();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void onLogin() {
    ref.watch(authControllerProvider.notifier).login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the state value from the authControllerProvider
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appBar,
      body: isLoading
          ? const Loader()
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
                            onLogin();
                          },
                          label: 'Login',
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
                              text: ' Sign up',
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
                                  builder: (context) => const SignUpView(),
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

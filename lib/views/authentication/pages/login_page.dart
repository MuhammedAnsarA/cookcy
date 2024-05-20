import 'package:cookcy/views/authentication/pages/forgot_password_page.dart';
import 'package:cookcy/views/main/main_screen.dart';
import 'package:cookcy/views/views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/blocs.dart';
import '../../../core/core.dart';
import '../../../core/utils/popups/loaders.dart';

class LoginPage extends HookWidget {
  static const routeName = "/login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            TLoaders.errorSnackBar(context, "Login Failed");
          } else if (state is LoginSuccess) {
            TLoaders.successSnackBar(context, "Login Success");
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20.h),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  SizedBox(height: 80.h),
                  BoldBlackText(text: "Welcome Back!", fontSize: 22.sp),
                  SizedBox(height: 5.h),
                  GreyText(
                      text: "Please enter your account here", fontSize: 13.sp),
                  SizedBox(height: 30.h),
                  LoginForm(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                  ),
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, ForgotPasswordPage.routeName),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child:
                          BlackText(text: "Forgot password?", fontSize: 13.sp),
                    ),
                  ),
                  SizedBox(height: 80.h),
                  RoundedButton(
                    label: state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white)),
                          )
                        : const Text("Login"),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      FirebaseAuth.instance.currentUser?.reload();
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(RequestEmailLogin(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ));
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  GreyText(text: "Orcontinue with", fontSize: 13.sp),
                  SizedBox(height: 15.h),
                  const GoogleAuthButton(),
                  SizedBox(height: 20.h),
                  RegisterLoginRowButton(
                    text: "Don't have any account? ",
                    buttonText: " Register.",
                    onTap: () => Navigator.pushReplacementNamed(
                        context, SignUpPage.routeName),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

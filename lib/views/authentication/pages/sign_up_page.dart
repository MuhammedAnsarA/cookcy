import 'package:cookcy/core/utils/popups/loaders.dart';
import 'package:cookcy/views/main/main_screen.dart';
import 'package:cookcy/views/views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/blocs.dart';
import '../../../core/core.dart';

class SignUpPage extends HookWidget {
  static const routeName = "/sign-up";

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            TLoaders.errorSnackBar(context, "Sign Up Failed");
          } else if (state is SignupSuccess) {
            TLoaders.successSnackBar(context, "Sign Up Success");
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.all(20.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  SizedBox(height: 52.h),
                  BoldBlackText(text: "Welcome!", fontSize: 22.sp),
                  SizedBox(height: 5.h),
                  GreyText(
                      text: "Please enter your account here", fontSize: 13.sp),
                  SignupForm(
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    usernameController: usernameController,
                    formKey: formKey,
                  ),
                  RoundedButton(
                    label: state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white)),
                          )
                        : const Text("Sign Up"),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      FirebaseAuth.instance.currentUser?.reload();
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(RequestEmailSignUp(
                              username: usernameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              confirmPassword:
                                  confirmPasswordController.text.trim(),
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
                    text: "Already have an account? ",
                    buttonText: " Login.",
                    onTap: () => Navigator.pushReplacementNamed(
                        context, LoginPage.routeName),
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

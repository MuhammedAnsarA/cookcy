import 'package:cookcy/application/authentication/auth_bloc.dart';
import 'package:cookcy/core/utils/const/text_strings.dart';
import 'package:cookcy/core/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/core.dart';

class ForgotPasswordPage extends HookWidget {
  static const routeName = "/forgot-password";

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            TLoaders.errorSnackBar(context, "Reset Failed");
          } else if (state is ForgotPasswordSuccess) {
            TLoaders.successSnackBar(
                context, TTexts.changeYourPasswordSubTitle);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20).copyWith(top: 60.h),
            children: [
              BoldBlackText(
                text: "Password Recovery",
                fontSize: 20.sp,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 7.h),
              GreyText(
                  text: "Enter your email to recover your password",
                  fontSize: 13.sp),
              SizedBox(height: 30.h),
              Form(
                key: formKey,
                child: InputField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: const Icon(Iconsax.direct_right),
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Email is required";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 30.h),
              RoundedButton(
                label: state is ForgotPasswordLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation(Colors.white)),
                      )
                    : const Text("Reset"),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(RequestForgotPassword(
                        email: emailController.text.trim()));
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}

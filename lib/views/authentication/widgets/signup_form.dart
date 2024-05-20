import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../application/blocs.dart';
import '../../../core/core.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController usernameController;
  final GlobalKey<FormState> formKey;
  const SignupForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.usernameController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 30.h),
          InputField(
            controller: usernameController,
            hintText: "Username",
            prefixIcon: const Icon(Iconsax.user),
            validator: (value) {
              if (value == "" || value == null) {
                return "Username is required";
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 10.h),
          InputField(
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
          SizedBox(height: 10.h),
          InputField(
            controller: passwordController,
            hintText: "Password",
            prefixIcon: const Icon(Iconsax.lock),
            obscureText: true,
            validator: (value) {
              if (value == "" || value == null) {
                return "Password is required";
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 10.h),
          BlocBuilder<ObscureTextCubit, ObscureTextState>(
            builder: (context, state) {
              return InputField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<ObscureTextCubit>().toggleObscuring();
                  },
                  child:
                      Icon(state.isObscured ? Iconsax.eye : Iconsax.eye_slash),
                ),
                obscureText: state.isObscured,
                overrideValidator: true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              );
            },
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

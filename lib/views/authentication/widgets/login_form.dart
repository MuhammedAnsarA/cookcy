import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/blocs.dart';
import '../../../core/core.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
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
          BlocBuilder<ObscureTextCubit, ObscureTextState>(
            builder: (context, state) {
              return InputField(
                controller: passwordController,
                hintText: "Password",
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<ObscureTextCubit>().toggleObscuring();
                  },
                  child:
                      Icon(state.isObscured ? Iconsax.eye : Iconsax.eye_slash),
                ),
                obscureText: state.isObscured,
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Password is required";
                  } else {
                    return null;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

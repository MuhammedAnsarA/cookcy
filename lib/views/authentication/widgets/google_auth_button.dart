import 'package:cookcy/core/utils/const/colors.dart';
import 'package:cookcy/core/utils/popups/loaders.dart';
import 'package:cookcy/views/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/blocs.dart';
import '../../../core/core.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is GoogleSuccess) {
          TLoaders.successSnackBar(context, "Login Success");
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.routeName, (route) => false);
        }
      },
      builder: (context, state) {
        return RoundedButton(
          label: state is GoogleLoading
              ? const Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation(Colors.white)),
                )
              : const Text("Google"),
          buttonColor: TColors.greenAccent,
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            FirebaseAuth.instance.currentUser?.reload();
            context.read<AuthBloc>().add(RequestGoogleLogin());
          },
        );
      },
    );
  }
}

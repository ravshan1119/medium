import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium/cubits/auth/auth_cubit.dart';
import 'package:medium/presentation/auth/widgets/global_text_fields.dart';

class EmailPasswordInput extends StatelessWidget {
  const EmailPasswordInput(
      {super.key,
      required this.gmailController,
      required this.passwordController});

  final TextEditingController gmailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GlobalTextField(
              hintText: "Gmail",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              controller: gmailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GlobalTextField(
              hintText: "Password",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              controller: passwordController,
            ),
          )
        ],
      );
    });
  }
}

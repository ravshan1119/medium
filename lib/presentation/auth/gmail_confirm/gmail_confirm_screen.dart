import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium/cubits/auth/auth_cubit.dart';
import 'package:medium/data/models/user/user_model.dart';
import 'package:medium/presentation/app_routes.dart';
import 'package:medium/presentation/auth/widgets/global_button.dart';
import 'package:medium/presentation/auth/widgets/global_text_fields.dart';
import 'package:medium/utils/colors/app_colors.dart';
import 'package:medium/utils/ui_utils/error_message_dialog.dart';


class GmailConfirmScreen extends StatefulWidget {
  GmailConfirmScreen({super.key, required this.userModel});

  UserModel userModel;

  @override
  State<GmailConfirmScreen> createState() => _GmailConfirmScreenState();
}

class _GmailConfirmScreenState extends State<GmailConfirmScreen> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gmail Confirm Screen"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalTextField(
                onChanged: (v){
                  code = v;
                },
                hintText: "Code",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
              ),
              GlobalButton(
                color: AppColors.white,
                textColor: AppColors.black,
                borderColor: AppColors.black,
                title: "Confirm",
                onTap: () {
                  context.read<AuthCubit>().confirmGmail(code);
                },
              ),
              const SizedBox(height: 50)
            ],
          );
        },
        listener: (context, state) {
          if (state is AuthConfirmCodeSuccessState) {
            // context.read<AuthCubit>().registerUser(widget.userModel);
          }

          if (state is AuthLoggedState) {
            Navigator.pushReplacementNamed(context, RouteNames.tabBox);
          }

          if (state is AuthErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
    );
  }
}
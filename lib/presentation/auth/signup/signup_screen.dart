import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medium/cubits/auth/auth_cubit.dart';
import 'package:medium/cubits/user_data/user_data_cubit.dart';
import 'package:medium/data/models/user/user_model.dart';
import 'package:medium/presentation/app_routes.dart';
import 'package:medium/presentation/auth/widgets/gender_selecter.dart';
import 'package:medium/presentation/auth/widgets/global_button.dart';
import 'package:medium/presentation/auth/widgets/global_text_fields.dart';
import 'package:medium/utils/colors/app_colors.dart';
import 'package:medium/utils/images/app_images.dart';
import 'package:medium/utils/ui_utils/error_message_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ImagePicker picker = ImagePicker();

  XFile? file;

  int gender = 1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // title: Text("SignUp"),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: BlocConsumer<AuthCubit,AuthState>(
        builder: (context,state){
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Register Account",
                        style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: "PlusJakartaSans"),
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(AppImages.cancel))
                    ],
                  ),
                  SizedBox(height: 27.h),
                  Text(
                    "You can create the account with input your name, email address, and password",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c_4D4D4D,
                        fontFamily: "PlusJakartaSans"),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: GlobalTextField(
                        hintText: "Username",
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        controller: usernameController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: GlobalTextField(
                        hintText: "Contact",
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        controller: phoneController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: GlobalTextField(
                        hintText: "Email",
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        controller: gmailController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: GlobalTextField(
                        hintText: "Password",
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        controller:passwordController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: GlobalTextField(
                        hintText: "Profession",
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        controller: professionController),
                  ),
                  SizedBox(height: 30.h),
                  // const SizedBox(height: 20),
                  GenderSelector(
                    onMaleTap: () {
                      setState(() {
                        gender = 1;
                      });
                    },
                    onFemaleTap: () {
                      setState(() {
                        gender = 0;
                      });
                    },
                    gender: gender,
                  ),
                  TextButton(
                      onPressed: () {
                        showBottomSheetDialog();
                      },
                      child: Text("Select image")),
                  SizedBox(height: 20.h),
                  GlobalButton(title: "Register", onTap: (){
                    if (context.read<UserDataCubit>().canRegister()) {
                      context.read<AuthCubit>().sendCodeToGmail(
                        context.read<UserDataCubit>().state.userModel.email,
                        context
                            .read<UserDataCubit>()
                            .state
                            .userModel
                            .password,
                      );
                    }else{
                      showErrorMessage(message: "Maydonlar to'liq emas", context: context);
                    }

                  }, color: Colors.black, borderColor: Colors.black, textColor: Colors.white),
                  SizedBox(height: 11.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You don't have an account?",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.c_4D4D4D,
                            fontFamily: "PlusJakartaSans"),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, RouteNames.loginScreen);
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              fontFamily: "PlusJakartaSans"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );

        },
          listener: (context, state) {
            if (state is AuthSendCodeSuccessState) {
              UserModel userModel = UserModel(
                password: passwordController.text,
                username: usernameController.text,
                email: gmailController.text,
                avatar: file!.path,
                contact: phoneController.text,
                gender: gender.toString(),
                profession: professionController.text,
                role: "male",
              );
              Navigator.pushNamed(
                context,
                RouteNames.confirmGmail,
                arguments: userModel,
              );
            }

            if (state is AuthErrorState) {
              showErrorMessage(message: state.errorText, context: context);
            }
          }
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.c_162023,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      file = xFile;
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      file = xFile;
    }
  }
}
// "username": "string",
// "contact": "string",
// "email": "string",
// "password": "string",
// "avatar": "string",
// "profession": "string",
// "role": "string",
// "gender": "string"

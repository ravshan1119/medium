import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medium/cubits/auth/auth_cubit.dart';
import 'package:medium/presentation/auth/widgets/global_button.dart';
import 'package:medium/presentation/auth/widgets/global_text_fields.dart';
import 'package:medium/utils/colors/app_colors.dart';
import 'package:medium/utils/images/app_images.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Padding(
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
                  hintText: "Email",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: emailController),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: GlobalTextField(
                  hintText: "Password",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: passwordController),
            ),
            SizedBox(height: 20.h),
            GlobalButton(title: "Log In", onTap: (){
              if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                context.read<AuthCubit>().loginUser(
                  gmail: emailController.text,
                  password: passwordController.text,
                );
              }
            }, color: Colors.black, borderColor: Colors.black, textColor: Colors.white),
            SizedBox(height: 27.h),


          ],
        ),
      ),
    );
  }
}

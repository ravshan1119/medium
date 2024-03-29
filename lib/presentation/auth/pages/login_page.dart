import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium/presentation/app_routes.dart';
import 'package:medium/presentation/auth/login/login_screen.dart';
import 'package:medium/presentation/auth/widgets/global_button.dart';
import 'package:medium/utils/colors/app_colors.dart';
import 'package:medium/utils/images/app_images.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onChanged});

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 42.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 4.h),
                  child: Container(
                    height: 16.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Container(
                    height: 16.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                      color: AppColors.c_999999,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 33.h),
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(AppImages.imageAuth))),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                "Get Knowledge",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                "     Get the knowledge by reading articles that are             "
                    "written on our platform",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            GlobalButton(title: ("Login account"), onTap: (){
              // onChanged.call();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LogInScreen()));
              },color: AppColors.black,borderColor: AppColors.black,textColor: Colors.white,),
            SizedBox(height: 16.h),
            GlobalButton(title: ("First Confirm your"), onTap: (){Navigator.pushNamed(context, RouteNames.confirmGmail);},color: AppColors.white,borderColor: AppColors.black,textColor: Colors.black,),

            // TextButton(
            //   onPressed: () {
            //     onChanged.call();
            //   },
            //   child: const Text(
            //     "Sign Up",
            //     style: TextStyle(
            //         color: Color(0xFF4F8962),
            //         fontSize: 18,
            //         fontWeight: FontWeight.w800),
            //   ),
            // ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, RouteNames.confirmGmail);
            //   },
            //   child: const Text(
            //     "First Confirm your",
            //     style: TextStyle(
            //         color: Color(0xFF4F8962),
            //         fontSize: 18,
            //         fontWeight: FontWeight.w800),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

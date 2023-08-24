import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium/cubits/auth/auth_cubit.dart';
import 'package:medium/data/local/storage_repository.dart';
import 'package:medium/presentation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _init() async {
    if (StorageRepository.getString("token").isEmpty) {
      Navigator.pushReplacementNamed(context, RouteNames.authScreen);
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.authScreen);
    }
  }


  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).checkLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Center(child: Text("Splash",style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
          ),));
        },
        listener: (context, state) {
          if (state is AuthUnAuthenticatedState) {
            Navigator.pushReplacementNamed(context, RouteNames.authScreen);
          }
          if (state is AuthLoggedState) {
            Navigator.pushReplacementNamed(context, RouteNames.tabBox);
          }
        },
      ),
    );
  }
}

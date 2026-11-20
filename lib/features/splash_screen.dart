import 'package:animate_do/animate_do.dart';
import 'package:edularn/constant/colors.dart';
import 'package:edularn/constant/image.dart';
import 'package:edularn/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              colors: [AppColors.splashColor1, AppColors.splashColor2],
            ),
            image: DecorationImage(
              image: AssetImage(AppImage.bookImage),
              alignment: AlignmentGeometry.bottomCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 150),
              BounceIn(
                duration: Duration(seconds: 5),
                child: Center(
                  child: Image(image: AssetImage(AppImage.appLogo)),
                ),
              onFinish: (direction){
                Navigator.pushNamed(context,RoutesName.onboarding);
              },
              ),

              Text(
                "EduLarn",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Learning ,Simplified",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: LinearProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.white.withOpacity(.4),
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),

              SizedBox(height: 6),
              Text(
                "INITIALISATION",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 250),
              Text(
                "POWERED BY EDULARN GLOBAL",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

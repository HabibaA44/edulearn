//import 'dart:math';

import 'package:edularn/constant/image.dart';
import 'package:edularn/custome_containar.dart';
//import 'package:edularn/features/home_screen.dart';
import 'package:edularn/routes/routes_name.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(0, 239, 239, 245),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            "Log In",
            style: TextStyle(
              color: Color(0xff0F172A),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Image(
                image: AssetImage(AppImage.loginImage),
                height: 160,
                width: 390,
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Color(0xff0F172A),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Enter your credentials to access your courses",
                  style: TextStyle(
                    color: Color(0xff64748B),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              EmailPassword(
                title: "email",
                hintTitle: "name@example.com",
                myIcon: Icons.email_outlined,
              ),
              EmailPassword(
                title: "Password",
                hintTitle: "Enter Your Password",
                myIcon: Icons.lock_outline,
                secIcon: Icons.visibility_outlined,
              ),
    
              Padding(
                padding: const EdgeInsets.only(left: 250),
                child: Text(
                  "Forget Pssword ?",
                  style: TextStyle(
                    color: Color(0xff1C74E9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color(0xff1C74E9),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                   Navigator.pushNamed(context, RoutesName.layoutScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.login_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //    Divider(height: 2,thickness: 2,color: Colors.black,),
              //    Text("Or continue with",style: TextStyle(color: Color(0xff94A3B8),fontWeight: FontWeight.bold),),
              //    Divider(height: 2,color: Colors.black,),
              //   ],
              // )
              Center(
                child: Text(
                  "Or continue with",
                  style: TextStyle(
                    color: Color(0xff94A3B8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white70,
                      ),
                      height: 55,
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage(AppImage.googlelogo)),
                          SizedBox(width: 5),
                          Text(
                            "Google",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white70,
                      ),
                      height: 55,
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage(AppImage.appleLogo)),
                          SizedBox(width: 5),
                          Text(
                            "Apple",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xff64748B)),
                  ),
                  Text(
                    " Sign Up",
                    style: TextStyle(color: Color(0xff1C74E9)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:edularn/constant/colors.dart';
//import 'package:edularn/features/login_screen.dart';
//import 'package:edularn/routes/app_routes.dart';
import 'package:edularn/routes/routes_name.dart';
import 'package:flutter/material.dart';

class BoardingHead extends StatelessWidget {
  final int index;
  const BoardingHead({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Spacer(flex: 2,),
                Center(
                  child: Text(index==0?
                    "Onboarding":"Collaboration",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                   if(index==0)
                   Navigator.pushNamed(context, RoutesName.logincSreen);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color:
                      index==0? AppColors.splashColor1:Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
  }
}
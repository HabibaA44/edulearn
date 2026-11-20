//import 'package:edularn/constant/image.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  final String title;
  final String discription;
  final String image;
  const OnboardPage({super.key,required this.discription ,required this.image ,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Image.asset(image,height: 400,),
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
             discription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
      ],
    );
  }
}
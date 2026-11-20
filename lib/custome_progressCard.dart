//import 'package:edularn/data/model_data.dart' as examData;
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class CustomeProgresscard extends StatelessWidget {
  final String subtitle;
  final String message;
  final int presentage;
  const CustomeProgresscard({super.key,
  required this.message,
  required this.presentage,
  required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                color: Color(0xff1C74E9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Progress",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                     subtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(height: 20),
        
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.white30,
                        borderRadius: BorderRadius.circular(15),
                       minHeight: 5,
                       value: presentage/100,
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}
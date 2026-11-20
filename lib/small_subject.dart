import 'package:flutter/material.dart';

class SmallSubject extends StatefulWidget {
  final String logo;
  final String title;
  final Color color;
  const SmallSubject({super.key, required this.logo,required this.title,required this.color});

  @override
  State<SmallSubject> createState() => _SmallSubjectState();
}

class _SmallSubjectState extends State<SmallSubject> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10),
      child: Column(
        children: [
         Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: widget.color
            
          ),
           child:  Padding(
             padding: const EdgeInsets.all(20.0),
             child: Image.asset(widget.logo,),
           )
         ),
         SizedBox(height: 5,),
         Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
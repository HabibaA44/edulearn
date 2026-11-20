//import 'package:edularn/profile_row.dart';
import 'package:flutter/material.dart';

class ProfileContiner extends StatelessWidget {
  final String title;
  final String num;
  final String extraNum;
  const ProfileContiner({
    super.key,
    this.title = "",
    this.extraNum = "",
    this.num = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      width: 105,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.grey.shade600,
           // fontWeight: FontWeight.bold,
            fontSize: 15)),
            SizedBox(height: 4,),
            Row(
              //mainAxisAlignment: MainAxisAlignment.,
              
              children: [Text(num,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(width: 4,),
             Text(extraNum,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 15),)
             ]),

             
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? logo;
  final Color? color;
  final bool onveiw;
  const ProfileRow({super.key,
  this.logo,
  this.subtitle="",
  this.title="",
  this.color,
  this.onveiw=true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
       
        children: [
          Container(
            decoration: BoxDecoration(
              color: color!.withAlpha(50),
              borderRadius: BorderRadius.circular(50)
            ),
            width: 50,
            height: 50,
            child: Icon(logo,color: color,),
          ),
          SizedBox(width: 10,),
          Column(
             mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ,style: TextStyle(fontWeight: FontWeight.bold,
               color:onveiw?  Colors.black : color ,
              fontSize: 18),),
              Text(subtitle,style: TextStyle(color: Colors.grey.shade600),)
            ],
          ),
         // onveiw? Icon(Icons.chevron_right):null,
         Spacer(),
         if(onveiw)Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
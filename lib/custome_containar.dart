import 'package:flutter/material.dart';

class EmailPassword extends StatefulWidget {
  final String title;
  final String hintTitle;
  final IconData myIcon;
  final  IconData?secIcon;
  
  const EmailPassword({super.key,required this.hintTitle,required this.title, required this.myIcon, this.secIcon});

  @override
  State<EmailPassword> createState() => _EmailPasswordState();
}

class _EmailPasswordState extends State<EmailPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
                  padding: const EdgeInsets.only(left: 15,top: 8),
                  child: Text(widget.title,
                    style: TextStyle(
                      color: Color(0xff334155),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5,),
                      ),
                      // border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5,),
                      ),
                      prefixIcon: Icon(
                       widget.myIcon,
                        color: Color(0xff94A3B8),
                      ),
                      hintText:widget.hintTitle,
                      hintStyle: TextStyle(color: Color(0xff94A3B8)),
                      suffixIcon: Icon(
                       widget.secIcon ,
                        color: Color(0xff94A3B8),
                      ),
                    ),
                  ),
                ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatefulWidget {
  final String? image;
  final String examName;
  final String time;
  final String question;
  final String date;
  final String title;
  final Color color;
  final VoidCallback? onVeiwDetails;
  const CustomCard({
    super.key,
     this.image,
     this.date=" ",
     this.examName=" ",
     this.question="",
     this.time="",
     this.title="",
      required this.color,
     this.onVeiwDetails
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.vertical(
              top: Radius.circular(16),
            ),
            child:
             widget.image !=null? Image.network(widget.image??""): Image.asset(
              widget.image??"",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.examName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.access_time,color: Colors.grey.shade700,),
                Text(widget.time,style: TextStyle(color: Colors.grey.shade700),),
                Text(" mins",style: TextStyle(color: Colors.grey.shade700),),
                //SizedBox(width: 40),
                Spacer(),
                Icon(Icons.quiz_outlined ,color: Colors.grey.shade700,),
                Text(widget.question,style: TextStyle(color: Colors.grey.shade700),),
                Text(" Questions",style: TextStyle(color: Colors.grey.shade700),),
                //SizedBox(width: 40),
                Spacer(),
                Icon(Icons.event_outlined ,color: Colors.grey.shade700,),
                Text(widget.date,style: TextStyle(color: Colors.grey.shade700),),
              
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 8, bottom: 15,right: 15),
            child: Row(
              children: [
                Container(
                  color: widget.color.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:
                    Row(children: [
                      Text("Level :",style: TextStyle(color: widget.color),),
                      Text(
                      widget.title,
                      style: TextStyle(color: widget.color),
                    ),
                    ],)
                    
                     
                  ),
                  
                ),
               // SizedBox(width: 100,),
               Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12)
                    )
                  ),
                
                  onPressed: widget.onVeiwDetails,
                  child: Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

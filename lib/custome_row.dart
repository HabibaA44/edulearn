import 'package:edularn/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:edularn/constant/colors.dart';

class CustomeRow extends StatelessWidget {
  final String title;
  final bool isViewAll ;
 final VoidCallback ? onSeeAllPresed;
  const CustomeRow({super.key,required this.title,this.isViewAll=true,this.onSeeAllPresed});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               // SizedBox(width: 190),
               Spacer(),
               isViewAll?
                TextButton(
                  onPressed: onSeeAllPresed,
                  child: Text(
                    "Veiw All",
                    style: TextStyle(
                      color: Color(0xff1C74E9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ):
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("3 Active",style: TextStyle(color:AppColors.splashColor1),),
                  ),
                )
              ],
            );
  }
}
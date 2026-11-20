import 'package:edularn/constant/image.dart';
import 'package:edularn/custom_card.dart';
import 'package:edularn/custome_progressCard.dart';
import 'package:edularn/custome_row.dart';
import 'package:edularn/data/data.dart';
import 'package:edularn/data/model_data.dart';
import 'package:edularn/provider/data_provider.dart';
import 'package:edularn/routes/routes_name.dart';
//import 'package:edularn/features/exam_screen.dart';
//import 'package:edularn/features/profile_Screen.dart';
import 'package:edularn/small_subject.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AppData examsData;
  @override
  void initState() {
    super.initState();
    examsData = AppData.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //   backgroundColor: Colors.white,
      //   leading: Image(image: AssetImage(AppImage.overlay)),
      //   title: Text(
      //     "EduLearn",
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     Icon(Icons.search_outlined, size: 30, color: Color(0xff475569)),
      //     SizedBox(width: 12),
      //     Icon(Icons.notifications, size: 30, color: Color(0xff475569)),
      //     SizedBox(width: 10),
      //   ],
      // ),
      body:
      
       Padding(
             padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
             child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
        children: [
          Image(image: AssetImage(AppImage.overlay)),
          SizedBox(width: 4,),
          Text( "EduLearn",
                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
                   Spacer(),
                  Icon(Icons.search_outlined, size: 30, color: Color(0xff475569)),
                   SizedBox(width: 12),
                   Icon(Icons.notifications, size: 30, color: Color(0xff475569)),
                   SizedBox(width: 10),
                
        ],
                   ),
                   SizedBox(height: 8,),
          Row(
            children: [
              Text(
                "Welcome back, ${context.watch<DataProvider>().userName}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              //  SizedBox(width: 90),
              Spacer(),
              Image(image: AssetImage(AppImage.person)),
            ],
          ),
          SizedBox(height: 10),
          CustomeProgresscard(
            subtitle: examsData.user?.dailyProgress?.message ?? "",
            message: examsData.user?.dailyProgress?.detail ?? "",
            presentage: examsData.user?.dailyProgress?.percentage ?? 0,
          ),
          SizedBox(height: 15),
          CustomeRow(title: "Categories"),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: examsData.categories?.length ?? 0,
              itemBuilder: (context, index) {
                return SmallSubject(
                  logo: examsData.categories?[index].icon ?? "",
                  title: examsData.categories?[index].name ?? "",
                  color: Color(
                    int.parse(
                      examsData.categories?[index].color!.replaceAll(
                            '#',
                            '0xff',
                          ) ??
                          "0xffFFFFFF",
                    ),
                  ),
                );
              },
              
            ),
          ),
          SizedBox(height: 15),
          CustomeRow(title: "Upcoming Exams", isViewAll: false),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: examsData.exams?.length ?? 0,
           itemBuilder: (context, index) {
         final colorString = examsData.exams?[index].levelColor ?? "#ffffffff";
       
         final color = Color(
           int.parse(colorString.replaceFirst('#', '0xff')),
         );
       
         return CustomCard(
           image: examsData.exams?[index].thumbnail ?? "",
           examName: examsData.exams?[index].title ?? "",
           time: examsData.exams?[index].duration.toString()??"",
           question: examsData.exams?[index].totalQuestions.toString()??"",
           date: examsData.exams?[index].dueDate ?? "",
           title: examsData.exams?[index].level ?? "",
           color: color,
           onVeiwDetails: (){
             Navigator.pushNamed(context,RoutesName.ExamDetailsScreen,
             arguments: examsData.exams?[index] );
           },
         );
       },
          ),
       
          
        ],
             ),
           ),
    );
  }
}

import 'package:edularn/constant/image.dart';
import 'package:edularn/data/model_data.dart';
import 'package:edularn/instruction_row.dart';
import 'package:edularn/provider/exam_provider.dart';
//import 'package:edularn/routes/app_routes.dart';
import 'package:edularn/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/widgets.dart';

class ExamDetailsScreen extends StatelessWidget {
  const ExamDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var examData = ModalRoute.of(context)?.settings.arguments as Exam;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exam Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                radius: 60,
                //backgroundImage: AssetImage(AppImage.examDetails),
                child: Image.asset(AppImage.examDetails, width: 50, height: 50),
              ),
            ),

            Text(
              examData.title ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "course : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  examData.course ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "CERTIFIED",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "Open Now",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 8,
                bottom: 8,
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xffF6F7F8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Instructions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        examData.instructions ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    // ListTile(

                    //   leading: Container(color: Colors.white),
                    //   title: Text(
                    //     "Duration",
                    //     style: TextStyle(color: Colors.grey.shade700),
                    //   ),
                    //   subtitle: Text(
                    //     "${examData.duration ?? 0} Minutes",
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    InstructionRow(
                      title: "DURATION",
                      subtitle: "${examData.duration ?? 0} Minutes",
                      logo: Icons.access_time,
                    ),
                    InstructionRow(
                      title: "QUESTIONS",
                      subtitle:
                          "${examData.totalQuestions ?? 0} Multipe Choice",
                      logo: Icons.quiz_outlined,
                    ),
                    InstructionRow(
                      title: "PASSING SCORE",
                      subtitle:
                          "${examData.passingScore ?? 0} % (${examData.passingCorrect} Correct )",
                      logo: Icons.verified_outlined,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              width: 360,
              decoration: BoxDecoration(
                color: Color(0xffFFFBEB),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xffFDE68A), width: 1),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Color(0xffFDE68A)),
                    SizedBox(width: 5),
                    Text(
                      "Once you click 'Start Exam', the timer will\n begin. You cannot pause or restart the\n session.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 232, 204, 92),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 30,
                bottom: 10,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                onPressed: () {
                  final examProvider=context.read<ExamProvider>();
                  examProvider.getSelectedExam(examId: examData.id??"");
                  Navigator.pushNamed(context,RoutesName.QuizScreen,arguments: examProvider);
                 
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start Exam",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 15),
              child: Text("By starting, you agree to the Academic Integrity Policy.",style: TextStyle(color: Colors.grey.shade600),),
            )
          ],
        ),
      ),
    );
  }
}

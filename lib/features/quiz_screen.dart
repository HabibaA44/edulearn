//import 'package:edularn/routes/app_routes.dart';
//import 'package:animate_do/animate_do.dart';
import 'package:edularn/provider/exam_provider.dart';
import 'package:edularn/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final ExamProvider _examProvider;
  late final PageController _controller;
  void initState() {
    super.initState();
    _examProvider = context.read<ExamProvider>();
    _controller = PageController();
    _controller.addListener(() {
      _examProvider.solvedQustion=_controller.page?.round()??0;

    
    },);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_examProvider.currentExam?.title ?? ""),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Text(
                        "You are about to leave ??",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(12),
                              ),
                            ),

                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "NO",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),

                          SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.popUntil(
                                context,
                                (route) =>
                                    route.settings.name ==
                                    RoutesName.layoutScreen,
                              );
                            },
                            child: Text(
                              "YES",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.close),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PROGRESS"),
                      Text(
                        "Question  ${context.watch<ExamProvider>().solvedQustion}/${_examProvider.currentExam?.questions?.length}",
                        
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Row(
                        children: [
                          Icon(Icons.timer_outlined, color: Colors.blue),
                          Text("  12:12", style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                color: Colors.blue,
                backgroundColor: Colors.white30,
                borderRadius: BorderRadius.circular(15),
                minHeight: 10,
                value: _examProvider.solvedQustion / (_examProvider.currentExam?.totalQuestions??1),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _examProvider.currentExam?.questions?.length,
                itemBuilder: (context, index) {
                  final currentQuastion =
                      _examProvider.currentExam?.questions?[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          currentQuastion?.text ?? "No Data",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10);
                            },
                            itemCount: currentQuastion?.options?.length ?? 0,
                            itemBuilder: (context, index) {
                              
                              final options = currentQuastion?.options?[index];
                              
                              return Consumer<ExamProvider>(builder: (context, provider, child){
                                final isSelected = _examProvider
                                  .userSelectedAnswer
                                  .any(
                                    (answer) =>
                                        answer["questionId"] ==
                                            currentQuastion?.id &&
                                        answer["answerId"] == options?.id,
                                  );
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _examProvider.SelectAnswerFormQuestion(
                                      options?.id,
                                      currentQuastion?.id ?? "",
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.grey.shade300,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Radio.adaptive(
                                          value: options?.id,
                                          groupValue: isSelected
                                              ? options?.id
                                              : null,
                                          activeColor: Colors.blue,
                                          onChanged: (value) {
                                            _examProvider.SelectAnswerFormQuestion(
                                              value,
                                              currentQuastion?.id ?? "",
                                            );
                                          },
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          currentQuastion
                                                  ?.options?[index]
                                                  .text ??
                                              "",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Previous",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () {

                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                        _examProvider.updateCurrentQuestion();
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 5),

                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

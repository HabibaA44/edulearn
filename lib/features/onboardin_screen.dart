import 'package:edularn/constant/colors.dart';
import 'package:edularn/constant/image.dart';
//import 'package:edularn/features/login_screen.dart';
import 'package:edularn/onbiard_head.dart';
import 'package:edularn/onboard_page.dart';
import 'package:edularn/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardinScreen extends StatefulWidget {
  const OnboardinScreen({super.key});

  @override
  State<OnboardinScreen> createState() => _OnboardinScreenState();
}

class _OnboardinScreenState extends State<OnboardinScreen> {
  late final PageController controller;

  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardBackground,
      body: SafeArea(
        child: Column(
          children: [
            BoardingHead(index: currentPage),
            // SizedBox(height: 4),
            Expanded(
              child: PageView(
                controller: controller,
                // onPageChanged: (index) {
                //   setState(() {
                //     currentPage = index;
                //   });
                // },
                children: [
                  OnboardPage(
                    discription:
                        "Get personalized study paths and \n resources tailored to your unique learning style",
                    title: "Learn Your Way",
                    image: AppImage.onboard1,
                  ),
                  OnboardPage(
                    discription:
                        "Join study groups and collaborate with \n fellow students across the globe.",
                    title: "Study with Peers",
                    image: AppImage.onboard2,
                  ),
                ],
              ),
            ),
            // SizedBox(height: 10,),
            SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xff1C74E9),
                dotColor: Color(0xffCBD5E1),
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xff1C74E9)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  if (currentPage == 0)
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  else {
                    Navigator.pushReplacementNamed(
                      context,RoutesName.logincSreen
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentPage == 0 ? "Next" : "Get Started",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Step ${currentPage + 1} of 2"),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

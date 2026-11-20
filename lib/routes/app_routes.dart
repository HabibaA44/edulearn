import 'package:edularn/features/exam_details_screen.dart';
import 'package:edularn/features/home_screen.dart';
import 'package:edularn/features/layout_screen.dart';
import 'package:edularn/features/quiz_screen.dart';
import 'package:edularn/provider/data_provider.dart';
import 'package:edularn/provider/exam_provider.dart';
import 'package:edularn/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:edularn/features/splash_screen.dart';
import 'package:edularn/features/onboardin_screen.dart';
import 'package:edularn/features/login_screen.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider;
// import 'package:edularn/features/home_screen.dart';
// import 'package:edularn/features/exam_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: settings,
        );

      case RoutesName.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardinScreen(),
          settings: settings,
        );

      case RoutesName.logincSreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: settings,
        );

      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: settings,
        );

      case RoutesName.layoutScreen:
        return MaterialPageRoute(
          builder: (context) {
            return ChangeNotifierProvider(
           create:(context)=>DataProvider(),
            child: LayoutScreen());},
          settings: settings,
        );

      case RoutesName.ExamDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ExamProvider(),
            child: ExamDetailsScreen()),
          settings: settings,
        );

      case RoutesName.QuizScreen:
      final examProvider =settings.arguments as ExamProvider;
        return MaterialPageRoute(
          builder: (context) =>ChangeNotifierProvider.value(
            value: examProvider,
            child: QuizScreen()),
          settings: settings,
        );
        
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
          settings: settings,
        );
    }
  }
}

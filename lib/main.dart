import 'package:edularn/provider/data_provider.dart';
import 'package:edularn/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    
    ChangeNotifierProvider(
      create:(context)=>DataProvider(), 
      child:  const MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.grey.shade200),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

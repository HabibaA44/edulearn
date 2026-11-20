//import 'package:edularn/constant/image.dart';
import 'package:edularn/features/exam_screen.dart';
import 'package:edularn/features/home_screen.dart';
import 'package:edularn/features/profile_Screen.dart';
import 'package:edularn/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
 // int currentIndex = 0;

  // void OnTabTapped(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [HomeScreen(), ExamScreen(), ProfileScreen()];

    
    return Scaffold(
      // appBar: AppBar(
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
      body: Pages[context.watch<DataProvider>().currentBottonIndex],
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.red,
        selectedItemColor: Colors.blue,
        //selectedLabelStyle: TextStyle(color: Colors.red),
       // unselectedLabelStyle: TextStyle(color: Colors.grey),
        currentIndex: context.watch<DataProvider>().currentBottonIndex,
        onTap: (value) {
          context.read<DataProvider>().UpdateBottonIndex(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined),label: "Exam",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

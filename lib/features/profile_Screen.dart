import 'package:edularn/profile_continer.dart';
import 'package:edularn/profile_row.dart';
import 'package:edularn/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.read<DataProvider>().UpdateBottonIndex(0);
        }
        , icon: Icon(Icons.arrow_back_outlined)),
        title: Text("Profile"),
        actions: [Icon(Icons.settings_outlined, size: 25), SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 80,
                width: 80,
              ),
              Text(
                context.watch<DataProvider>().userName,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Computer Science Student",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_month_outlined, color: Colors.blue),
                  Text(
                    "Joined January 2023",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  spacing: 15,
                  children: [
                    ProfileContiner(title: "EXAMS", num: "42", extraNum: "+5"),
                    ProfileContiner(title: "AVG", num: "88%", extraNum: "+2%"),
                    ProfileContiner(
                      title: "HOURS",
                      num: "156",
                      extraNum: "+12",
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  "Account Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),

              ProfileRow(
                color: Colors.blue,
                title: "Personal Information",
                subtitle: "Name, email, and phone number",
                logo: Icons.person_outlined,
              ),
              ProfileRow(
                color: Colors.blue,
                title: "Notifications",
                subtitle: "Alerts for exams and courses",
                logo: Icons.notifications_active_outlined,
              ),
              ProfileRow(
                color: Colors.blue,
                title: "Security",
                subtitle: "Password and authentication",
                logo: Icons.security_outlined,
              ),
              ProfileRow(color: Colors.red, title: "Logout",logo: Icons.logout_outlined,onveiw: false,),
            ],
          ),
        ),
      ),
    );
  }
}

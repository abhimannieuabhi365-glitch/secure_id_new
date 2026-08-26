// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/student/send_complaint.dart';
// import 'package:untitled/student/view_application_status.dart';
// import 'package:untitled/student/view_certificate.dart';
// import 'package:untitled/student/view_company.dart';
// import 'package:untitled/student/view_complaint_reply.dart';
// import 'package:untitled/student/view_subject.dart';
// import 'package:untitled/student/view_vacancy.dart';
// import 'package:untitled/student/viewprofile.dart';
// import 'package:untitled/view_application.dart';
// import 'package:untitled/view_candidate.dart';
//
// import '../add_vacancy.dart';
// import 'change_password.dart';
//
// void main(){
//   runApp(studhome());
// }
// class studhome extends StatelessWidget {
//   const studhome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: studhome_sub(),);
//   }
// }
// class studhome_sub extends StatefulWidget {
//   const studhome_sub({Key? key}) : super(key: key);
//
//   @override
//   State<studhome_sub> createState() => _studhome_subState();
// }
//
// class _studhome_subState extends State<studhome_sub> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(child: Column(children: [
//         ListTile(title: Text("view profile"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>view_profile())),),
//         ListTile(title: Text("View subject"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>view_subject())),),
//         ListTile(title: Text("view certificate"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>view_certificate())),),
//         ListTile(title: Text("view company"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>view_company())),),
//         ListTile(title: Text("view application status"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>view_application_status())),),
//         ListTile(title: Text("Change password"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>studchange_password())),),
//         ListTile(title: Text("send complaint"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>send_complaint())),),
//         ListTile(title: Text("view reply"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>view_complaint_reply())),),
//       ],),),
//       appBar: AppBar(title: Text("USERHOME"),centerTitle: true,),
//       body: Center(child: Text("WElcome"),),
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/LOFIN.dart';
import 'package:untitled1/student/send_complaint.dart';
import 'package:untitled1/student/view_application_status.dart';
import 'package:untitled1/student/view_certificate.dart';
import 'package:untitled1/student/view_company.dart';
import 'package:untitled1/student/view_complaint_reply.dart';
import 'package:untitled1/student/view_subject.dart';
import 'package:untitled1/student/view_vacancy.dart';
import 'package:untitled1/student/viewprofile.dart';
import 'package:untitled1/view_application.dart';
import 'package:untitled1/view_candidate.dart';

import '../add_vacancy.dart';
import 'change_password.dart';

void main() {
  runApp(studhome());
}

class studhome extends StatelessWidget {
  const studhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: studhome_sub(),
    );
  }
}

class studhome_sub extends StatefulWidget {
  const studhome_sub({Key? key}) : super(key: key);

  @override
  State<studhome_sub> createState() => _studhome_subState();
}

class _studhome_subState extends State<studhome_sub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1a2980), Color(0xFF26d0ce)],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF3498db), Color(0xFF2980b9)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 70,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "STUDENT DASHBOARD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Digital Waves System",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    padding: EdgeInsets.only(top: 20),
                    children: [
                      _buildDrawerItem(
                        icon: Icons.person_outline,
                        title: "View Profile",
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => view_profile())),
                      ),
                      _buildDrawerItem(
                        icon: Icons.menu_book,
                        title: "View Subject",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => view_subject())),
                      ),
                      _buildDrawerItem(
                        icon: Icons.assignment,
                        title: "View Certificate",
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => view_certificate())),
                      ),
                      _buildDrawerItem(
                        icon: Icons.business,
                        title: "View Company",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => view_company())),
                      ),
                      _buildDrawerItem(
                        icon: Icons.track_changes,
                        title: "View Application Status",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => view_application_status())),
                      ),
                      _buildDrawerItem(
                        icon: Icons.lock_outline,
                        title: "Change Password",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => studchange_password())),
                      ),
                      _buildDrawerItem(
                        icon: Icons.feedback,
                        title: "Send Complaint",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => send_complaint())),
                      ),
                      _buildDrawerItem(
                        icon: Icons.chat_bubble_outline,
                        title: "View Reply",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => view_complaint_reply())),
                      ),
                      SizedBox(height: 30),
                      Divider(),
                      _buildDrawerItem(
                        icon: Icons.logout,
                        title: "Logout",
                        color: Colors.red,
                        onTap: () {
                          // Add logout logic here
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "STUDENT DASHBOARD",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3498db), Color(0xFF2980b9)],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
        ),
        elevation: 5,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1a2980), Color(0xFF26d0ce)],
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ],
              border: Border.all(
                color: Color(0xFF2c3e50),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF3498db), Color(0xFF2980b9)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.school,
                        size: 60,
                        color: Colors.white,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "WELCOME TO DIGITAL WAVES",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Student Portal",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Student Management System",
                  style: TextStyle(
                    color: Color(0xFF2c3e50),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Manage your profile, view subjects, certificates, companies, and more from this dashboard",
                  style: TextStyle(
                    color: Color(0xFF7f8c8d),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                  ],
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF3498db).withOpacity(0.1),
                        Color(0xFF2980b9).withOpacity(0.1)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFF3498db),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "Use the menu on the left to navigate through all student options",
                    style: TextStyle(
                      color: Color(0xFF2c3e50),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.blue,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF2c3e50),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFF3498db),
      ),
      onTap: onTap,
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildQuickStat({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3498db), Color(0xFF2980b9)],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF3498db).withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(height: 10),
        Text(
          value,
          style: TextStyle(
            color: Color(0xFF2c3e50),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF7f8c8d),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

// // import 'dart:convert';
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart'as http;
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // void main(){
// //   runApp(add_vacancy());
// // }
// //
// // class add_vacancy extends StatelessWidget {
// //   const add_vacancy({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(home: add_vacancy_sub(),);
// //   }
// // }
// // class add_vacancy_sub extends StatefulWidget {
// //   const add_vacancy_sub({Key? key}) : super(key: key);
// //
// //   @override
// //   State<add_vacancy_sub> createState() => _add_vacancy_subState();
// // }
// //
// // class _add_vacancy_subState extends State<add_vacancy_sub> {
// //
// //   TextEditingController  jobname=TextEditingController();
// //   TextEditingController  qualification=TextEditingController();
// //   TextEditingController  skills=TextEditingController();
// //   TextEditingController  experience=TextEditingController();
// //   TextEditingController  apply_form=TextEditingController();
// //   TextEditingController  apply_to=TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Center(child: Column(children: [
// //         SizedBox(height: 30,width: 300,child: TextField(controller:jobname,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter job name"),),),
// //     SizedBox(height: 30,width: 300,child: TextField(controller:qualification,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your qualification"),),),
// //     SizedBox(height: 30,width: 300,child: TextField(controller:skills,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter skills"),),),
// //     SizedBox(height: 30,width: 300,child: TextField(controller:experience,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your experience"),),),
// //     SizedBox(height: 30,width: 300,child: TextField(controller:apply_form,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "apply form"),),),
// //     SizedBox(height: 30,width: 300,child: TextField(controller:apply_to,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "apply to"),),),
// //     ElevatedButton(onPressed: () async {
// //     SharedPreferences prefs=await SharedPreferences.getInstance();
// //     var data=await http.post(Uri.parse(prefs.getString("ip").toString()+'/cmpny_add_vacancy'),body:
// //     {
// //     'jobname':jobname.text,
// //     'qualification':qualification.text,
// //     'skills':skills.text,
// //     'experience':experience.text,
// //     'apply_form':apply_form.text,
// //     'apply_to':apply_to.text,
// //       'cid':prefs.getString("cid").toString()
// //
// //     }
// //     );
// //     var d=await json.decode(data.body);
// //     if(d['status'] == 'ok'){
// //
// //     showDialog(context: context, builder: (context)=>AlertDialog(title: Text("Vacancy"),content: Text("added succesfull"),actions: [TextButton(onPressed: (){
// //     Navigator.push(context, MaterialPageRoute(builder: (context)=>add_vacancy()));
// //
// //     }, child: Text("OK"))],));
// //     }
// //     }, child: Text("Add"))]))
// //      );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:untitled/userhome.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(add_vacancy());
// }
//
// class add_vacancy extends StatelessWidget {
//   const add_vacancy({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: add_vacancy_sub(),
//       theme: ThemeData(
//         primaryColor: Color(0xFF007bff),
//         primaryColorDark: Color(0xFF0056b3),
//         // accentColor: Color(0xFF28a745),
//         backgroundColor: Color(0xFFf8f9fa),
//         fontFamily: 'OpenSans',
//         textTheme: TextTheme(
//           headline5: TextStyle(
//             fontFamily: 'Jost',
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: Color(0xFF343a40),
//           ),
//           bodyText1: TextStyle(
//             fontSize: 16,
//             color: Color(0xFF495057),
//           ),
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Color(0xFFdee2e6)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Color(0xFF007bff), width: 2),
//           ),
//           labelStyle: TextStyle(color: Color(0xFF6c757d)),
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             primary: Color(0xFF007bff),
//             onPrimary: Colors.white,
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             textStyle: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class add_vacancy_sub extends StatefulWidget {
//   const add_vacancy_sub({Key? key}) : super(key: key);
//
//   @override
//   State<add_vacancy_sub> createState() => _add_vacancy_subState();
// }
//
// class _add_vacancy_subState extends State<add_vacancy_sub> {
//   TextEditingController jobname = TextEditingController();
//   TextEditingController qualification = TextEditingController();
//   TextEditingController skills = TextEditingController();
//   TextEditingController experience = TextEditingController();
//   TextEditingController apply_form = TextEditingController();
//   TextEditingController apply_to = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFf8f9fa),
//       appBar: AppBar(leading: IconButton(onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>userhome()));
//       }, icon: Icon(Icons.arrow_back)),
//         title: Row(
//           children: [
//             Icon(
//               Icons.book_rounded,
//               color: Colors.white,
//               size: 28,
//             ),
//             SizedBox(width: 10),
//             Text(
//               'DIGITAL WAVES',
//               style: TextStyle(
//                 fontFamily: 'Jost',
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: 1,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Color(0xFF007bff),
//         elevation: 3,
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               // Header Card
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Color(0xFF007bff),
//                         Color(0xFF0056b3),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'ADD NEW VACANCY',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                           fontFamily: 'Jost',
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Fill in the details below to post a new job vacancy',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white.withOpacity(0.9),
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//
//               // Form Container
//               Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(24),
//                   child: Column(
//                     children: [
//                       // Job Name Field
//                       Container(
//                         margin: EdgeInsets.only(bottom: 16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.work_outline,
//                                   color: Color(0xFF007bff),
//                                   size: 20,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'Job Name',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color(0xFF343a40),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             TextField(
//                               controller: jobname,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFFdee2e6),
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFF007bff),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 hintText: 'Enter job name',
//                                 hintStyle: TextStyle(
//                                   color: Color(0xFF6c757d),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                   vertical: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Qualification Field
//                       Container(
//                         margin: EdgeInsets.only(bottom: 16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.school_outlined,
//                                   color: Color(0xFF007bff),
//                                   size: 20,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'Qualification',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color(0xFF343a40),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             TextField(
//                               controller: qualification,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFFdee2e6),
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFF007bff),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 hintText: 'Enter required qualification',
//                                 hintStyle: TextStyle(
//                                   color: Color(0xFF6c757d),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                   vertical: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Skills Field
//                       Container(
//                         margin: EdgeInsets.only(bottom: 16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.psychology_outlined,
//                                   color: Color(0xFF007bff),
//                                   size: 20,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'Skills Required',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color(0xFF343a40),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             TextField(
//                               controller: skills,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFFdee2e6),
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFF007bff),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 hintText: 'Enter required skills',
//                                 hintStyle: TextStyle(
//                                   color: Color(0xFF6c757d),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                   vertical: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Experience Field
//                       Container(
//                         margin: EdgeInsets.only(bottom: 16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.timeline_outlined,
//                                   color: Color(0xFF007bff),
//                                   size: 20,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'Experience',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color(0xFF343a40),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             TextField(
//                               controller: experience,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFFdee2e6),
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFF007bff),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 hintText: 'Enter experience required',
//                                 hintStyle: TextStyle(
//                                   color: Color(0xFF6c757d),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                   vertical: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Date Range Row
//                       Row(
//                         children: [
//                           // Apply From
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(bottom: 16, right: 8),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.date_range_outlined,
//                                         color: Color(0xFF007bff),
//                                         size: 20,
//                                       ),
//                                       SizedBox(width: 8),
//                                       Text(
//                                         'Apply From',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600,
//                                           color: Color(0xFF343a40),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 8),
//                                   TextField(
//                                     controller: apply_form,
//                                     decoration: InputDecoration(
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(
//                                           color: Color(0xFFdee2e6),
//                                         ),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(
//                                           color: Color(0xFF007bff),
//                                           width: 2,
//                                         ),
//                                       ),
//                                       hintText: 'DD/MM/YYYY',
//                                       hintStyle: TextStyle(
//                                         color: Color(0xFF6c757d),
//                                       ),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 16,
//                                         vertical: 14,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           // Apply To
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(bottom: 16, left: 8),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.date_range_outlined,
//                                         color: Color(0xFF007bff),
//                                         size: 20,
//                                       ),
//                                       SizedBox(width: 8),
//                                       Text(
//                                         'Apply To',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600,
//                                           color: Color(0xFF343a40),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 8),
//                                   TextField(
//                                     controller: apply_to,
//                                     decoration: InputDecoration(
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(
//                                           color: Color(0xFFdee2e6),
//                                         ),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(
//                                           color: Color(0xFF007bff),
//                                           width: 2,
//                                         ),
//                                       ),
//                                       hintText: 'DD/MM/YYYY',
//                                       hintStyle: TextStyle(
//                                         color: Color(0xFF6c757d),
//                                       ),
//                                       contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 16,
//                                         vertical: 14,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       SizedBox(height: 24),
//
//                       // Submit Button
//                       Container(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             SharedPreferences prefs =
//                             await SharedPreferences.getInstance();
//                             var data = await http.post(
//                                 Uri.parse(prefs.getString("ip").toString() +
//                                     '/cmpny_add_vacancy'),
//                                 body: {
//                                   'jobname': jobname.text,
//                                   'qualification': qualification.text,
//                                   'skills': skills.text,
//                                   'experience': experience.text,
//                                   'apply_form': apply_form.text,
//                                   'apply_to': apply_to.text,
//                                   'cid': prefs.getString("cid").toString()
//                                 });
//                             var d = await json.decode(data.body);
//                             if (d['status'] == 'ok') {
//                               showDialog(
//                                   context: context,
//                                   builder: (context) => AlertDialog(
//                                     title: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.check_circle,
//                                           color: Color(0xFF28a745),
//                                           size: 24,
//                                         ),
//                                         SizedBox(width: 10),
//                                         Text(
//                                           "Success",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w600,
//                                             color: Color(0xFF343a40),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     content: Text("Vacancy added successfully!"),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       add_vacancy()));
//                                         },
//                                         child: Text(
//                                           "OK",
//                                           style: TextStyle(
//                                             color: Color(0xFF007bff),
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ));
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xFF007bff),
//                             padding: EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             elevation: 2,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.add_circle_outline,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 "ADD VACANCY",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   letterSpacing: 0.5,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               // Information Card
//               SizedBox(height: 20),
//               Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.info_outline,
//                             color: Color(0xFF007bff),
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             'Important Information',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFF343a40),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         '• Please fill all the required fields accurately\n'
//                             '• Vacancy will be visible to job seekers immediately\n'
//                             '• You can edit or delete vacancies from your dashboard\n'
//                             '• Ensure dates are in correct format (DD/MM/YYYY)',
//                         style: TextStyle(
//                           color: Color(0xFF6c757d),
//                           height: 1.5,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       // Bottom Navigation similar to web footer
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Color(0xFF343a40),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10,
//               offset: Offset(0, -2),
//             ),
//           ],
//         ),
//         padding: EdgeInsets.symmetric(vertical: 16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'DIGITAL WAVES',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//                 fontFamily: 'Jost',
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Secure document management with QR code technology',
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 12,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.facebook, color: Colors.white70, size: 20),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.settings_input_antenna, color: Colors.white70, size: 20),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.linked_camera, color: Colors.white70, size: 20),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.photo_camera, color: Colors.white70, size: 20),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//             SizedBox(height: 4),
//             Text(
//               '© 2023 Digital Waves. All rights reserved.',
//               style: TextStyle(
//                 color: Colors.white60,
//                 fontSize: 11,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/userhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(add_vacancy());
}

class add_vacancy extends StatelessWidget {
  const add_vacancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: add_vacancy_sub(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class add_vacancy_sub extends StatefulWidget {
  const add_vacancy_sub({Key? key}) : super(key: key);

  @override
  State<add_vacancy_sub> createState() => _add_vacancy_subState();
}

class _add_vacancy_subState extends State<add_vacancy_sub> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController jobname = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController apply_form = TextEditingController();
  TextEditingController apply_to = TextEditingController();

  String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? lettersOnlyValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return "Only letters allowed";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => userhome()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("DIGITAL WAVES"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                /// Job Name
                TextFormField(
                  controller: jobname,
                  validator: lettersOnlyValidator,
                  decoration: InputDecoration(
                    labelText: "Job Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                /// Qualification
                TextFormField(
                  controller: qualification,
                  validator: requiredValidator,
                  decoration: InputDecoration(
                    labelText: "Qualification",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                /// Skills
                TextFormField(
                  controller: skills,
                  validator: lettersOnlyValidator,
                  decoration: InputDecoration(
                    labelText: "Skills",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                /// Experience
                TextFormField(
                  controller: experience,
                  validator: requiredValidator,
                  decoration: InputDecoration(
                    labelText: "Experience",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                /// Apply From
                TextFormField(
                  controller: apply_form,
                  validator: requiredValidator,
                  decoration: InputDecoration(
                    labelText: "Apply From (DD/MM/YYYY)",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                /// Apply To
                TextFormField(
                  controller: apply_to,
                  validator: requiredValidator,
                  decoration: InputDecoration(
                    labelText: "Apply To (DD/MM/YYYY)",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 24),

                /// Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                      var response = await http.post(
                        Uri.parse(
                            prefs.getString("ip").toString() +
                                "/cmpny_add_vacancy"),
                        body: {
                          'jobname': jobname.text,
                          'qualification': qualification.text,
                          'skills': skills.text,
                          'experience': experience.text,
                          'apply_form': apply_form.text,
                          'apply_to': apply_to.text,
                          'cid': prefs.getString("cid").toString(),
                        },
                      );

                      var data = json.decode(response.body);

                      if (data['status'] == "ok") {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("Success"),
                            content:
                            Text("Vacancy added successfully"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              userhome()));

                                  Navigator.of(context,rootNavigator: true).pop();
                                },
                                child: Text("OK"),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    child: Text("ADD VACANCY"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

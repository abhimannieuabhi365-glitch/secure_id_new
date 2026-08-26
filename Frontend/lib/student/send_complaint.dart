// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart'as http;
// // import 'package:shared_preferences/shared_preferences.dart';
// // void main()
// // {
// //   runApp(send_complaint());
// // }
// // class send_complaint extends StatelessWidget {
// //   const send_complaint({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(home: send_complaint_sub(),);
// //   }
// // }
// // class send_complaint_sub extends StatefulWidget {
// //   const send_complaint_sub({Key? key}) : super(key: key);
// //
// //   @override
// //   State<send_complaint_sub> createState() => send_complaint_sub_State();
// // }
// //
// // class send_complaint_sub_State extends State<send_complaint_sub> {
// //   TextEditingController complaint=TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(body:Center(child: Column(children: [TextField(controller: complaint,decoration: InputDecoration(hintText: "name", border: OutlineInputBorder()),
// //     ),
// //       ElevatedButton(onPressed: ()async{
// //         SharedPreferences prefs=await SharedPreferences.getInstance();
// //         var data=await http.post(Uri.parse(prefs.getString("ip").toString()+'/send_complaint'),body:
// //         {
// //           'complaint':complaint.text,
// //           'sid':prefs.getString('sid').toString(),
// //         }
// //         );
// //
// //       }, child:Text("submit"))
// //
// //     ],),));
// //   }
// // }
// //
// //
// //
// //
// //
// //
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(send_complaint());
// }
//
// class send_complaint extends StatelessWidget {
//   const send_complaint({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Segoe UI',
//       ),
//       home: const send_complaint_sub(),
//     );
//   }
// }
//
// class send_complaint_sub extends StatefulWidget {
//   const send_complaint_sub({Key? key}) : super(key: key);
//
//   @override
//   State<send_complaint_sub> createState() => send_complaint_sub_State();
// }
//
// class send_complaint_sub_State extends State<send_complaint_sub> {
//   TextEditingController complaint = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "SEND COMPLAINT",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.5,
//           ),
//         ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xFF3498db), Color(0xFF2980b9)],
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 blurRadius: 10,
//                 spreadRadius: 2,
//               )
//             ],
//           ),
//         ),
//         elevation: 5,
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF1a2980), Color(0xFF26d0ce)],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               padding: EdgeInsets.all(30),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.95),
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 20,
//                     spreadRadius: 5,
//                   )
//                 ],
//                 border: Border.all(
//                   color: Color(0xFF2c3e50),
//                   width: 2,
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [Color(0xFF3498db), Color(0xFF2980b9)],
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.feedback,
//                           size: 50,
//                           color: Colors.white,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "SEND YOUR COMPLAINT",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 1.5,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "We value your feedback",
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.9),
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   Container(
//                     padding: EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFf8f9fa),
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: Color(0xFF3498db).withOpacity(0.3),
//                         width: 1,
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         Text(
//                           "Please describe your complaint in detail",
//                           style: TextStyle(
//                             color: Color(0xFF2c3e50),
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "Your feedback helps us improve our services",
//                           style: TextStyle(
//                             color: Color(0xFF7f8c8d),
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 25),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Complaint Details",
//                         style: TextStyle(
//                           color: Color(0xFF2c3e50),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(
//                             color: Color(0xFF3498db),
//                             width: 2,
//                           ),
//                         ),
//                         child: TextField(
//                           controller: complaint,
//                           maxLines: 5,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 15),
//                             hintText: "Enter your complaint here...",
//                             hintStyle: TextStyle(
//                               color: Color(0xFF95a5a6),
//                             ),
//                             prefixIcon: Padding(
//                               padding: EdgeInsets.only(bottom: 60),
//                               child: Icon(
//                                 Icons.message,
//                                 color: Color(0xFF3498db),
//                               ),
//                             ),
//                           ),
//                           style: TextStyle(
//                             color: Color(0xFF2c3e50),
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 30),
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [Color(0xFF3498db), Color(0xFF2980b9)],
//                       ),
//                       borderRadius: BorderRadius.circular(8),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF3498db).withOpacity(0.3),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                         )
//                       ],
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         SharedPreferences prefs =
//                         await SharedPreferences.getInstance();
//                         var data = await http.post(
//                             Uri.parse(prefs.getString("ip").toString() +
//                                 '/send_complaint'),
//                             body: {
//                               'complaint': complaint.text,
//                               'sid': prefs.getString('sid').toString(),
//                             });
//
//                         // Show success dialog
//                         _showSuccessDialog(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                         padding:
//                         EdgeInsets.symmetric(vertical: 18, horizontal: 40),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.send,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             "SUBMIT COMPLAINT",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       "Cancel",
//                       style: TextStyle(
//                         color: Color(0xFF3498db),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Container(
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xFF3498db), Color(0xFF2980b9)],
//             ),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//             ),
//           ),
//           child: Text(
//             "Complaint Sent",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//         ),
//         content: Container(
//           padding: EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 Icons.check_circle,
//                 color: Color(0xFF27ae60),
//                 size: 60,
//               ),
//               SizedBox(height: 15),
//               Text(
//                 "Your complaint has been submitted successfully!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF2c3e50),
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "We will review it and get back to you soon.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF7f8c8d),
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [Color(0xFF3498db), Color(0xFF2980b9)],
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 complaint.clear();
//               },
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Text(
//                   "OK",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/student/stud_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(send_complaint());
}

class send_complaint extends StatelessWidget {
  const send_complaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const send_complaint_sub(),
    );
  }
}

class send_complaint_sub extends StatefulWidget {
  const send_complaint_sub({Key? key}) : super(key: key);

  @override
  State<send_complaint_sub> createState() => send_complaint_sub_State();
}

class send_complaint_sub_State extends State<send_complaint_sub> {
  TextEditingController complaint = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SEND COMPLAINT",
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
          child: SingleChildScrollView(
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
              child: Form(
                key: _formKey,
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
                            Icons.feedback,
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "SEND YOUR COMPLAINT",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "We value your feedback",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFFf8f9fa),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF3498db).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Please describe your complaint in detail",
                            style: TextStyle(
                              color: Color(0xFF2c3e50),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Your feedback helps us improve our services",
                            style: TextStyle(
                              color: Color(0xFF7f8c8d),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Complaint Details *",
                          style: TextStyle(
                            color: Color(0xFF2c3e50),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFF3498db),
                              width: 2,
                            ),
                          ),
                          child: TextFormField(
                            controller: complaint,
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              hintText: "Enter your complaint here...",
                              hintStyle: TextStyle(
                                color: Color(0xFF95a5a6),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(bottom: 60),
                                child: Icon(
                                  Icons.message,
                                  color: Color(0xFF3498db),
                                ),
                              ),
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                            style: TextStyle(
                              color: Color(0xFF2c3e50),
                              fontSize: 16,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Complaint cannot be empty';
                              }
                              if (value.trim().isEmpty) {
                                return 'Complaint cannot be just spaces';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF3498db), Color(0xFF2980b9)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF3498db).withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Validate form
                          if (_formKey.currentState!.validate()) {
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            var data = await http.post(
                                Uri.parse(prefs.getString("ip").toString() +
                                    '/send_complaint'),
                                body: {
                                  'complaint': complaint.text,
                                  'sid': prefs.getString('sid').toString(),
                                });

                            // Show success dialog
                            _showSuccessDialog(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "SUBMIT COMPLAINT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>studhome()));
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xFF3498db),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3498db), Color(0xFF2980b9)],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Text(
            "Complaint Sent",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Color(0xFF27ae60),
                size: 60,
              ),
              SizedBox(height: 15),
              Text(
                "Your complaint has been submitted successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2c3e50),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We will review it and get back to you soon.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF7f8c8d),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3498db), Color(0xFF2980b9)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                complaint.clear();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
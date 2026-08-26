// //
// //
// // import 'dart:convert';
// //
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;
// //
// // import '../LOFIN.dart';
// //
// // void main()
// // {
// //   runApp(studchange_password());
// // }
// // class studchange_password extends StatelessWidget {
// //   const studchange_password({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(home: studchange_password(),);
// //   }
// // }
// //
// // class studchange_passwordsub extends StatefulWidget {
// //   const studchange_passwordsub({Key? key}) : super(key: key);
// //
// //   @override
// //   State<studchange_passwordsub> createState() => _studchange_passwordsubstate();
// // }
// //
// // class _studchange_passwordsubstate extends State<studchange_passwordsub> {
// //
// //   TextEditingController  current=TextEditingController();
// //   TextEditingController  newp=TextEditingController();
// //   TextEditingController  confirm=TextEditingController();
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Center(child: Column(children: [
// //         SizedBox(height: 30,width: 300,child: TextField(controller:current,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "current password"),),),
// //          SizedBox(height: 30,width: 300,child: TextField(controller:newp,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "new password"),),),
// //          SizedBox(height: 30,width: 300,child: TextField(controller:confirm,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "confirm password"),),),
// //       ElevatedButton(onPressed: () async {
// //
// //         SharedPreferences prefs=await SharedPreferences.getInstance();
// //         var data=await http.post(Uri.parse(prefs.getString("ip").toString()+'/studcmpny_change_password'),body:
// //         {
// //           'current':current.text,
// //           'newp':newp.text,
// //           'confirm':confirm.text,
// //           'sid':prefs.getString("sid").toString()
// //         }
// //         );
// //         var d=await json.decode(data.body);
// //         if(current.text == prefs.getString("pwd").toString()){
// //           if(newp.text ==confirm.text ){
// //             if(d['status'] == 'ok'){
// //               showDialog(context: context, builder: (context)=>AlertDialog(title: Text("password changed"),content: Text("succesfull"),actions: [TextButton(onPressed: (){
// //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
// //
// //               }, child: Text("OK"))],));
// //             }
// //           }
// //         }
// //
// //       }, child: Text("Submit")
// //
// //     )]
// //     )));
// //   }
// // }
//
//
//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// import '../LOFIN.dart';
//
// void main() {
//   runApp(studchange_password());
// }
//
// class studchange_password extends StatelessWidget {
//   const studchange_password({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Segoe UI',
//       ),
//       home: const studchange_passwordsub(),
//     );
//   }
// }
//
// class studchange_passwordsub extends StatefulWidget {
//   const studchange_passwordsub({Key? key}) : super(key: key);
//
//   @override
//   State<studchange_passwordsub> createState() => _studchange_passwordsubstate();
// }
//
// class _studchange_passwordsubstate extends State<studchange_passwordsub> {
//   TextEditingController current = TextEditingController();
//   TextEditingController newp = TextEditingController();
//   TextEditingController confirm = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "CHANGE PASSWORD",
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
//                           Icons.lock_reset,
//                           size: 50,
//                           color: Colors.white,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "CHANGE PASSWORD",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 1.5,
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
//                           "Enter your password details below",
//                           style: TextStyle(
//                             color: Color(0xFF2c3e50),
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "All fields are required",
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
//                         "Current Password",
//                         style: TextStyle(
//                           color: Color(0xFF2c3e50),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           // marginBottom: 8,
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
//                           controller: current,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 15),
//                             hintText: "Enter current password",
//                             hintStyle: TextStyle(
//                               color: Color(0xFF95a5a6),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.lock,
//                               color: Color(0xFF3498db),
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
//                   SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "New Password",
//                         style: TextStyle(
//                           color: Color(0xFF2c3e50),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           // marginBottom: 8,
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
//                           controller: newp,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 15),
//                             hintText: "Enter new password",
//                             hintStyle: TextStyle(
//                               color: Color(0xFF95a5a6),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.lock_outline,
//                               color: Color(0xFF3498db),
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
//                   SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Confirm Password",
//                         style: TextStyle(
//                           color: Color(0xFF2c3e50),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           // marginBottom: 8,
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
//                           controller: confirm,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 15),
//                             hintText: "Confirm new password",
//                             hintStyle: TextStyle(
//                               color: Color(0xFF95a5a6),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.lock_reset,
//                               color: Color(0xFF3498db),
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
//                                 '/studcmpny_change_password'),
//                             body: {
//                               'current': current.text,
//                               'newp': newp.text,
//                               'confirm': confirm.text,
//                               'sid': prefs.getString("sid").toString()
//                             });
//                         var d = await json.decode(data.body);
//                         if (current.text == prefs.getString("pwd").toString()) {
//                           if (newp.text == confirm.text) {
//                             if (d['status'] == 'ok') {
//                               showDialog(
//                                   context: context,
//                                   builder: (context) => AlertDialog(
//                                     title: Container(
//                                       padding: EdgeInsets.all(15),
//                                       decoration: BoxDecoration(
//                                         gradient: LinearGradient(
//                                           begin: Alignment.topLeft,
//                                           end: Alignment.bottomRight,
//                                           colors: [
//                                             Color(0xFF3498db),
//                                             Color(0xFF2980b9)
//                                           ],
//                                         ),
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(12),
//                                           topRight: Radius.circular(12),
//                                         ),
//                                       ),
//                                       child: Text(
//                                         "Password Changed",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                     ),
//                                     content: Container(
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 20),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           Icon(
//                                             Icons.check_circle,
//                                             color: Color(0xFF27ae60),
//                                             size: 60,
//                                           ),
//                                           SizedBox(height: 15),
//                                           Text(
//                                             "Password has been changed successfully!",
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               color: Color(0xFF2c3e50),
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     actions: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           gradient: LinearGradient(
//                                             begin: Alignment.topLeft,
//                                             end: Alignment.bottomRight,
//                                             colors: [
//                                               Color(0xFF3498db),
//                                               Color(0xFF2980b9)
//                                             ],
//                                           ),
//                                           borderRadius:
//                                           BorderRadius.circular(8),
//                                         ),
//                                         child: TextButton(
//                                           onPressed: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         login()));
//                                           },
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 20,
//                                                 vertical: 10),
//                                             child: Text(
//                                               "OK",
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 16,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                       BorderRadius.circular(15),
//                                     ),
//                                   ));
//                             }
//                           } else {
//                             _showErrorDialog(
//                                 context, "New passwords do not match!");
//                           }
//                         } else {
//                           _showErrorDialog(
//                               context, "Current password is incorrect!");
//                         }
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
//                             Icons.check_circle,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             "SUBMIT",
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
//   void _showErrorDialog(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Container(
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xFFe74c3c), Color(0xFFc0392b)],
//             ),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//             ),
//           ),
//           child: Text(
//             "Error",
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
//                 Icons.error_outline,
//                 color: Color(0xFFe74c3c),
//                 size: 60,
//               ),
//               SizedBox(height: 15),
//               Text(
//                 message,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF2c3e50),
//                   fontSize: 16,
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
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../LOFIN.dart';

void main() {
  runApp(studchange_password());
}

class studchange_password extends StatelessWidget {
  const studchange_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const studchange_passwordsub(),
    );
  }
}

class studchange_passwordsub extends StatefulWidget {
  const studchange_passwordsub({Key? key}) : super(key: key);

  @override
  State<studchange_passwordsub> createState() => _studchange_passwordsubstate();
}

class _studchange_passwordsubstate extends State<studchange_passwordsub> {
  TextEditingController current = TextEditingController();
  TextEditingController newp = TextEditingController();
  TextEditingController confirm = TextEditingController();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Error messages
  String? _currentError;
  String? _newpError;
  String? _confirmError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CHANGE PASSWORD",
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
                            Icons.lock_reset,
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "CHANGE PASSWORD",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
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
                            "Enter your password details below",
                            style: TextStyle(
                              color: Color(0xFF2c3e50),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Password must be at least 8 characters long",
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
                          "Current Password *",
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
                              color: _currentError != null ? Colors.red : Color(0xFF3498db),
                              width: 2,
                            ),
                          ),
                          child: TextFormField(
                            controller: current,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              hintText: "Enter current password",
                              hintStyle: TextStyle(
                                color: Color(0xFF95a5a6),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xFF3498db),
                              ),
                              errorText: _currentError,
                            ),
                            style: TextStyle(
                              color: Color(0xFF2c3e50),
                              fontSize: 16,
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Current password is required';
                            //   }
                            //   if (value.length < 8) {
                            //     return 'Password must be at least 8 characters';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Password *",
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
                              color: _newpError != null ? Colors.red : Color(0xFF3498db),
                              width: 2,
                            ),
                          ),
                          child: TextFormField(
                            controller: newp,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              hintText: "Enter new password",
                              hintStyle: TextStyle(
                                color: Color(0xFF95a5a6),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Color(0xFF3498db),
                              ),
                              errorText: _newpError,
                            ),
                            style: TextStyle(
                              color: Color(0xFF2c3e50),
                              fontSize: 16,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'New password is required';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              if (value == current.text) {
                                return 'New password must be different from current';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm Password *",
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
                              color: _confirmError != null ? Colors.red : Color(0xFF3498db),
                              width: 2,
                            ),
                          ),
                          child: TextFormField(
                            controller: confirm,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              hintText: "Confirm new password",
                              hintStyle: TextStyle(
                                color: Color(0xFF95a5a6),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_reset,
                                color: Color(0xFF3498db),
                              ),
                              errorText: _confirmError,
                            ),
                            style: TextStyle(
                              color: Color(0xFF2c3e50),
                              fontSize: 16,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != newp.text) {
                                return 'Passwords do not match';
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
                          // Reset errors
                          setState(() {
                            _currentError = null;
                            _newpError = null;
                            _confirmError = null;
                          });

                          // Validate form
                          if (_formKey.currentState!.validate()) {
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                            // Validate current password matches stored password
                            if (current.text != prefs.getString("pwd").toString()) {
                              setState(() {
                                _currentError = "Current password is incorrect";
                              });
                              _showErrorDialog(context, "Current password is incorrect!");
                              return;
                            }

                            // Validate new password matches confirm password
                            if (newp.text != confirm.text) {
                              setState(() {
                                _confirmError = "Passwords do not match";
                              });
                              _showErrorDialog(context, "New passwords do not match!");
                              return;
                            }

                            try {
                              var data = await http.post(
                                  Uri.parse(prefs.getString("ip").toString() +
                                      '/studcmpny_change_password'),
                                  body: {
                                    'current': current.text,
                                    'newp': newp.text,
                                    'confirm': confirm.text,
                                    'sid': prefs.getString("sid").toString()
                                  });

                              if (data.statusCode == 200) {
                                var d = await json.decode(data.body);
                                if (d['status'] == 'ok') {
                                  // Update stored password
                                  await prefs.setString("pwd", newp.text);

                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF3498db),
                                                Color(0xFF2980b9)
                                              ],
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                          child: Text(
                                            "Password Changed",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20),
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
                                                "Password has been changed successfully!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF2c3e50),
                                                  fontSize: 16,
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
                                                colors: [
                                                  Color(0xFF3498db),
                                                  Color(0xFF2980b9)
                                                ],
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            login()));
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10),
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
                                          borderRadius:
                                          BorderRadius.circular(15),
                                        ),
                                      ));
                                } else {
                                  _showErrorDialog(context, "Failed to change password. Please try again.");
                                }
                              } else {
                                _showErrorDialog(context, "Network error. Please check your connection.");
                              }
                            } catch (e) {
                              _showErrorDialog(context, "An error occurred: $e");
                            }
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
                              Icons.check_circle,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "SUBMIT",
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
                        Navigator.pop(context);
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

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFe74c3c), Color(0xFFc0392b)],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Text(
            "Error",
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
                Icons.error_outline,
                color: Color(0xFFe74c3c),
                size: 60,
              ),
              SizedBox(height: 15),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2c3e50),
                  fontSize: 16,
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
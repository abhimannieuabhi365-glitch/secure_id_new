//
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/register.dart';
// import 'package:untitled/student/stud_home.dart';
// import 'package:untitled/userhome.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
//
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: loginsub(),);
//   }
// }
//
//
//
// class loginsub extends StatefulWidget{
//   const loginsub({Key? key}) : super(key: key);
//
//   @override
//   State<loginsub> createState() => _loginsubState();
//
// }
//
// class _loginsubState extends State<loginsub> {
//   TextEditingController name=TextEditingController();
//   TextEditingController password=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body:Center(child: Column(children: [TextField(controller: name,decoration: InputDecoration(hintText: "name", border: OutlineInputBorder()),
//     ),
//       TextField(controller: password,decoration: InputDecoration(hintText: "password",border: OutlineInputBorder()),),
//       ElevatedButton(onPressed: () async {
//
//         SharedPreferences prefs=await SharedPreferences.getInstance();
//         var data=await http.post(Uri.parse(prefs.getString("ip").toString()+'/cmpny_login'),body:
//         {
//           'username':name.text,
//           'password':password.text
//         }
//         );
//         var d=await json.decode(data.body);
//         if(d['status'] == 'ok'){
//           if(d['type']=='company'){
//           prefs.setString("cid", d['cid']);
//           prefs.setString("pwd", password.text);
//           showDialog(context: context, builder: (context)=>AlertDialog(title: Text("LOGIN"),content: Text("succesfull"),actions: [TextButton(onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => userhome()));
//
//           }, child: Text("OK"))],));
//         }
//           if(d['type']=='student'){
//             prefs.setString("sid", d['sid']);
//             prefs.setString("pwd", password.text);
//             showDialog(context: context, builder: (context)=>AlertDialog(title: Text("LOGIN"),content: Text("succesfull"),actions: [TextButton(onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => studhome()));
//
//             }, child: Text("OK"))],));
//           }
//         }
//       },
//           child:Text("login")),
//       ElevatedButton(onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
//       },
//           child:Text("register") )
//
//     ],),));
//   }
// }













import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled1/register.dart';
import 'package:untitled1/scan_qr.dart';
import 'package:untitled1/student/stud_home.dart';
import 'package:untitled1/userhome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'forgotemail.dart';
import 'forgotpass.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginsub(),
      theme: ThemeData(
        primaryColor: Color(0xFF007bff),
        primaryColorDark: Color(0xFF0056b3),
        scaffoldBackgroundColor: Color(0xFFf8f9fa),
      ),
    );
  }
}

class loginsub extends StatefulWidget {
  const loginsub({Key? key}) : super(key: key);

  @override
  State<loginsub> createState() => _loginsubState();
}

class _loginsubState extends State<loginsub> {
  TextEditingController name = TextEditingController(text: 'achu@gmail.com');
  TextEditingController password = TextEditingController(text: 'achu@1234');

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf8f9fa),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Gradient
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF007bff),
                    Color(0xFF0056b3),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book_rounded,
                    color: Colors.white,
                    size: 70,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'DIGITAL WAVES',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Secure Document Management',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Login Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF343a40),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Welcome back! Please login to your account',
                        style: TextStyle(
                          color: Color(0xFF6c757d),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),

                      // Username Field
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF007bff),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Username',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF343a40),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFFdee2e6)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFF007bff), width: 2),
                                ),
                                hintText: 'Enter your username',
                                hintStyle: TextStyle(color: Color(0xFF6c757d)),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Password Field
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF007bff),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF343a40),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: password,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFFdee2e6)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFF007bff), width: 2),
                                ),
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(color: Color(0xFF6c757d)),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    color: Color(0xFF6c757d),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Login Button
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            var data = await http.post(
                                Uri.parse(prefs.getString("ip").toString() + '/cmpny_login'),
                                body: {
                                  'username': name.text,
                                  'password': password.text
                                }
                            );
                            var d = await json.decode(data.body);
                            if (d['status'] == 'ok') {
                              if (d['type'] == 'company') {
                                prefs.setString("cid", d['cid']);
                                prefs.setString("pwd", password.text);
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 24,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "LOGIN",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Text("Login successful!"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => userhome()),
                                          );
                                        },
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                            color: Color(0xFF007bff),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (d['type'] == 'student') {
                                prefs.setString("sid", d['sid'].toString());
                                prefs.setString("pwd", password.text);
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 24,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "LOGIN",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Text("Login successful!"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => studhome()),
                                          );
                                        },
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                            color: Color(0xFF007bff),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF007bff),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 2,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Register Button
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xFF007bff)),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_add,
                                color: Color(0xFF007bff),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "REGISTER",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF007bff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Forgot Password
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotemail()));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFF6c757d),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Forgot Password
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>QrScanPage()));
                        },
                        child: Text(
                          'Verify Document?',
                          style: TextStyle(
                            color: Color(0xFF6c757d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            // Information Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Color(0xFF007bff),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Login Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF343a40),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        '• Companies: Manage your job postings and applications\n'
                            '• Students: Browse and apply for job opportunities\n'
                            '• Secure QR code document management system',
                        style: TextStyle(
                          color: Color(0xFF6c757d),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),

            // Footer
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Color(0xFF343a40),
              child: Column(
                children: [
                  Text(
                    'DIGITAL WAVES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Secure document management with QR code technology',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook, color: Colors.white70, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.settings_input_antenna, color: Colors.white70, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.linked_camera, color: Colors.white70, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.photo_camera, color: Colors.white70, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '© 2023 Digital Waves. All rights reserved.',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12,
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
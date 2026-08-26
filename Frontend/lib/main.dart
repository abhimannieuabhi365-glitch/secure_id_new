// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'LOFIN.dart';
//
// void main(){
//   runApp(mainpage());
// }
// class mainpage extends StatelessWidget {
//   const mainpage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: mainpagesub(),);
//   }
// }
//
//
//
// class mainpagesub extends StatefulWidget {
//   const mainpagesub({Key? key}) : super(key: key);
//
//   @override
//   State<mainpagesub> createState() => _mainpagesubState();
// }
//
// class _mainpagesubState extends State<mainpagesub> {
//
//   TextEditingController ip=TextEditingController(text:"192.168.29.119");
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(child: Column(children: [
//           SizedBox(height: 30,
//             width: 300,
//             child: TextField(controller: ip,decoration: InputDecoration(
//                 border: OutlineInputBorder(), labelText: "enter ip"),),),
//           ElevatedButton(onPressed: () async {
//             SharedPreferences prefs=await SharedPreferences.getInstance();
//             prefs.setString("ip", "http://${ip.text}:8000");
//
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
//
//           }, child: Text("submit"))
//         ],),))
//     ;
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LOFIN.dart';

void main() {
  runApp(mainpage());
}

class mainpage extends StatelessWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainpagesub(),
      theme: ThemeData(
        primaryColor: Color(0xFF007bff),
        primaryColorDark: Color(0xFF0056b3),
        scaffoldBackgroundColor: Color(0xFFf8f9fa),
      ),
    );
  }
}

class mainpagesub extends StatefulWidget {
  const mainpagesub({Key? key}) : super(key: key);

  @override
  State<mainpagesub> createState() => _mainpagesubState();
}

class _mainpagesubState extends State<mainpagesub> {
  TextEditingController ip = TextEditingController(text:"192.168.29.115");

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
                  SizedBox(height: 8),
                  Text(
                    'Server Configuration',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Configuration Card
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
                        'SERVER SETUP',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF343a40),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Configure your server IP address to connect to the application',
                        style: TextStyle(
                          color: Color(0xFF6c757d),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),

                      // IP Address Field
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.dns_outlined,
                                  color: Color(0xFF007bff),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Server IP Address',
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
                              controller: ip,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFFdee2e6)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFF007bff), width: 2),
                                ),
                                hintText: 'Enter server IP address',
                                hintStyle: TextStyle(color: Color(0xFF6c757d)),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                prefixIcon: Icon(
                                  Icons.http,
                                  color: Color(0xFF6c757d),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: Color(0xFF6c757d),
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Default IP: 192.168.29.119 - Change if using different server',
                                    style: TextStyle(
                                      color: Color(0xFF6c757d),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Submit Button
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString("ip", "http://${ip.text}:8888");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
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
                                Icons.settings_ethernet,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "CONNECT TO SERVER",
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
                            'Server Configuration Guide',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF343a40),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoItem('• Enter the IP address of your Django server'),
                          _buildInfoItem('• Default port is 8000'),
                          _buildInfoItem('• Ensure server is running before connecting'),
                          _buildInfoItem('• Use local IP for local development'),
                          _buildInfoItem('• Contact admin for production server details'),
                        ],
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

  Widget _buildInfoItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            color: Color(0xFF007bff),
            size: 8,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF6c757d),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
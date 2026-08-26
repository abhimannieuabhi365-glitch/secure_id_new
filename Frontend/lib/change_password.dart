//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// import 'LOFIN.dart';
//
// void main()
// {
//   runApp(change_password());
// }
// class change_password extends StatelessWidget {
//   const change_password({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: change_password_sub(),);
//   }
// }
//
// class change_password_sub extends StatefulWidget {
//   const change_password_sub({Key? key}) : super(key: key);
//
//   @override
//   State<change_password_sub> createState() => _change_password_substate();
// }
//
// class _change_password_substate extends State<change_password_sub> {
//
//   TextEditingController  current=TextEditingController();
//   TextEditingController  newp=TextEditingController();
//   TextEditingController  confirm=TextEditingController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(child: Column(children: [
//         SizedBox(height: 30,width: 300,child: TextField(controller:current,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "current password"),),),
//          SizedBox(height: 30,width: 300,child: TextField(controller:newp,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "new password"),),),
//          SizedBox(height: 30,width: 300,child: TextField(controller:confirm,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "confirm password"),),),
//       ElevatedButton(onPressed: () async {
//
//         SharedPreferences prefs=await SharedPreferences.getInstance();
//         var data=await http.post(Uri.parse(prefs.getString("ip").toString()+'/cmpny_change_password'),body:
//         {
//           'current':current.text,
//           'newp':newp.text,
//           'confirm':confirm.text,
//           'cid':prefs.getString("cid").toString()
//         }
//         );
//         var d=await json.decode(data.body);
//         if(current.text == prefs.getString("pwd").toString()){
//           if(newp.text ==confirm.text ){
//             if(d['status'] == 'ok'){
//               showDialog(context: context, builder: (context)=>AlertDialog(title: Text("password changed"),content: Text("succesfull"),actions: [TextButton(onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
//
//               }, child: Text("OK"))],));
//             }
//           }
//         }
//         else{
//           showDialog(context: context, builder: (context)=>AlertDialog(
//             title: Text('password updation page'),
//             content: Text('password mismatch or incorrect'),
//             actions: [
//               TextButton(onPressed: (){
//                 Navigator.pop(context);
//               }, child: Text('ok'))
//             ],
//           ));
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>change_password()));
//         }
//
//       }, child: Text("Submit")
//
//     )]
//     )));
//   }
// }












import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'LOFIN.dart';

void main() {
  runApp(change_password());
}

class change_password extends StatelessWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: change_password_sub(),
      theme: ThemeData(
        primaryColor: Color(0xFF007bff),
        primaryColorDark: Color(0xFF0056b3),
        scaffoldBackgroundColor: Color(0xFFf8f9fa),
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Jost',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF343a40),
          ),
          // bodyText1: TextStyle(
          //   fontSize: 16,
          //   color: Color(0xFF495057),
          // ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFdee2e6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF007bff), width: 2),
          ),
          labelStyle: TextStyle(color: Color(0xFF6c757d)),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF007bff),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class change_password_sub extends StatefulWidget {
  const change_password_sub({Key? key}) : super(key: key);

  @override
  State<change_password_sub> createState() => _change_password_substate();
}

class _change_password_substate extends State<change_password_sub> {
  TextEditingController current = TextEditingController();
  TextEditingController newp = TextEditingController();
  TextEditingController confirm = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf8f9fa),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.book_rounded,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(width: 10),
            Text(
              'DIGITAL WAVES',
              style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF007bff),
        elevation: 3,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Header Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF007bff),
                        Color(0xFF0056b3),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.lock_reset_rounded,
                        color: Colors.white,
                        size: 48,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'CHANGE PASSWORD',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'Jost',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Update your account password securely',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Form Container
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Current Password Field
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
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
                                  'Current Password',
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
                              controller: current,
                              obscureText: _obscureCurrent,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFdee2e6),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFF007bff),
                                    width: 2,
                                  ),
                                ),
                                hintText: 'Enter current password',
                                hintStyle: TextStyle(
                                  color: Color(0xFF6c757d),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureCurrent
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xFF6c757d),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureCurrent = !_obscureCurrent;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // New Password Field
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.lock_open_outlined,
                                  color: Color(0xFF007bff),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'New Password',
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
                              controller: newp,
                              obscureText: _obscureNew,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFdee2e6),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFF007bff),
                                    width: 2,
                                  ),
                                ),
                                hintText: 'Enter new password',
                                hintStyle: TextStyle(
                                  color: Color(0xFF6c757d),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureNew
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xFF6c757d),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureNew = !_obscureNew;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Confirm Password Field
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.lock_outlined,
                                  color: Color(0xFF007bff),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Confirm Password',
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
                              controller: confirm,
                              obscureText: _obscureConfirm,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFdee2e6),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFF007bff),
                                    width: 2,
                                  ),
                                ),
                                hintText: 'Confirm new password',
                                hintStyle: TextStyle(
                                  color: Color(0xFF6c757d),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirm
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xFF6c757d),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureConfirm = !_obscureConfirm;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24),

                      // Submit Button
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            var data = await http.post(
                                Uri.parse(prefs.getString("ip").toString() +
                                    '/cmpny_change_password'),
                                body: {
                                  'current': current.text,
                                  'newp': newp.text,
                                  'confirm': confirm.text,
                                  'cid': prefs.getString("cid").toString()
                                });
                            var d = await json.decode(data.body);
                            if (current.text ==
                                prefs.getString("pwd").toString()) {
                              if (newp.text == confirm.text) {
                                if (d['status'] == 'ok') {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        title: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Color(0xFF28a745),
                                              size: 24,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "Password Changed",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF343a40),
                                              ),
                                            ),
                                          ],
                                        ),
                                        content: Text(
                                            "Password changed successfully!"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          login()));
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
                                      ));
                                }
                              }
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          color: Color(0xFFdc3545),
                                          size: 24,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Password Update Failed',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF343a40),
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Text(
                                        'Password mismatch or incorrect'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                            color: Color(0xFF007bff),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          change_password()));
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
                                Icons.lock_reset,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "CHANGE PASSWORD",
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

              // Password Requirements Card
              SizedBox(height: 20),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.security_outlined,
                            color: Color(0xFF007bff),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Password Requirements',
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
                          _buildRequirement(
                              'Minimum 8 characters', Icons.check_circle),
                          _buildRequirement(
                              'At least one uppercase letter', Icons.check_circle),
                          _buildRequirement(
                              'At least one number', Icons.check_circle),
                          _buildRequirement(
                              'At least one special character', Icons.check_circle),
                          _buildRequirement(
                              'Should not match old password', Icons.check_circle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Security Tips Card
              SizedBox(height: 20),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Color(0xFF28a745),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Security Tips',
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
                        '• Always use a strong, unique password\n'
                            '• Never share your password with anyone\n'
                            '• Change your password regularly\n'
                            '• Log out from shared devices\n'
                            '• Enable two-factor authentication if available',
                        style: TextStyle(
                          color: Color(0xFF6c757d),
                          height: 1.5,
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

      // Bottom Navigation similar to web footer
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF343a40),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'DIGITAL WAVES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Jost',
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Secure document management with QR code technology',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook, color: Colors.white70, size: 20),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings_input_antenna,
                      color: Colors.white70, size: 20),
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
            SizedBox(height: 4),
            Text(
              '© 2023 Digital Waves. All rights reserved.',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequirement(String text, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xFF28a745),
            size: 16,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF495057),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
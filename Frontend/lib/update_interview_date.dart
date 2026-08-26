// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:untitled/view_candidate.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// void main(){
//   runApp(update_date());
// }
//
// class update_date extends StatelessWidget {
//   const update_date({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: update_datesub(),);
//   }
// }
//
// class update_datesub extends StatefulWidget {
//   const update_datesub({Key? key}) : super(key: key);
//
//   @override
//   State<update_datesub> createState() => _update_datesubState();
// }
//
// class _update_datesubState extends State<update_datesub> {
//   final date=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: SingleChildScrollView(child: SizedBox(height: 500,width: 500,child: Column(children: [
//       TextField(controller: date, decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: 'enter interview date',
//         labelText: 'date'
//
//       ),),SizedBox(height: 20,),
//       ElevatedButton(onPressed: () async {
//         SharedPreferences sh=await SharedPreferences.getInstance();
//         var data=await http.post(Uri.parse('${sh.getString('ip')}/update_date'),
//         body: {
//           'date':date.text,
//           'applid':sh.getString('applid').toString(),
//         });
//         showDialog(context: context, builder: (context)=>AlertDialog(
//           title: Text('interview date'),
//           content: Text('date updated'),
//           actions: [
//             TextButton(onPressed: (){
//               Navigator.pop(context);
//             }, child: Text('ok'))
//           ],
//         ));
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>viewcandidate()));
//       }, child: Text('update'))
//     ],),),),),);
//   }
// }



// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:untitled1/view_candidate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(update_date());
}

class update_date extends StatelessWidget {
  const update_date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: update_datesub(),
      theme: ThemeData(
          primaryColor: Color(0xFF007bff),
          primaryColorDark: Color(0xFF0056b3),
          scaffoldBackgroundColor: Color(0xFFf8f9fa),
      ),
    );
  }
}

class update_datesub extends StatefulWidget {
  const update_datesub({Key? key}) : super(key: key);

  @override
  State<update_datesub> createState() => _update_datesubState();
}

class _update_datesubState extends State<update_datesub> {
  final date = TextEditingController();

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
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF007bff),
        elevation: 3,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Card
            Container(
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
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'UPDATE INTERVIEW DATE',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Schedule interview date for candidate',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Form Container
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      // Date Field
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color: Color(0xFF007bff),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Interview Date',
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
                              controller: date,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFFdee2e6)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFF007bff), width: 2),
                                ),
                                hintText: 'DD/MM/YYYY',
                                labelText: 'Enter interview date',
                                labelStyle: TextStyle(color: Color(0xFF6c757d)),
                                hintStyle: TextStyle(color: Color(0xFF6c757d)),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                prefixIcon: Icon(
                                  Icons.calendar_month_outlined,
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
                                    'Enter date in DD/MM/YYYY format',
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

                      // Update Button
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences sh = await SharedPreferences.getInstance();
                            var data = await http.post(
                              Uri.parse('${sh.getString('ip')}/update_date'),
                              body: {
                                'date': date.text,
                                'applid': sh.getString('applid').toString(),
                              },
                            );
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
                                      'Interview Date',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                content: Text('Date updated successfully'),
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
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => viewcandidate()),
                            );
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
                                Icons.update_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "UPDATE DATE",
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

            SizedBox(height: 20),

            // Information Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
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
                            color: Color(0xFF007bff),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Important Information',
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
                          _buildInfoItem('• The candidate will be notified about the interview date'),
                          _buildInfoItem('• Ensure the date is in correct format (DD/MM/YYYY)'),
                          _buildInfoItem('• Date cannot be changed once submitted'),
                          _buildInfoItem('• You will be redirected to candidates list'),
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
    ));
  }
}

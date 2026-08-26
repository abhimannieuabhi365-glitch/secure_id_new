// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
// void main()
// {
//   runApp(view_application_status());
// }
//
// class view_application_status extends StatelessWidget {
//   const view_application_status({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_application_status_sub(),);
//   }
// }
// class view_application_status_sub extends StatefulWidget {
//   const view_application_status_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_application_status_sub> createState() => _view_application_status_subState();
// }
//
// class _view_application_status_subState extends State<view_application_status_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_view_application_status"),
//         body: {"sid":prefs.getString('sid').toString()}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//           joke["id"].toString(),
//           joke["compname"].toString(),
//           joke["jobname"],
//           joke["qualification"].toString(),
//           joke["skills"].toString(),
//           joke["apply_to"].toString(),
//           joke["date"].toString(),
//           joke["interview_date"].toString(),
//           joke["status"].toString(),
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( body:
//
//
//     Container(
//
//       child:
//       FutureBuilder(
//         future: _getJokes(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
// //              print("snapshot"+snapshot.toString());
//           if (snapshot.data == null) {
//             return Container(
//               child: Center(
//                 child: Text("Loading..."),
//               ),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var i = snapshot.data![index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 3,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       side: BorderSide(color: Colors.grey.shade300),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           SizedBox(height: 10),
//                           _buildRow("company name:", i.compname.toString()),
//                           _buildRow("jobname:", i.jobname.toString()),
//                           _buildRow("qualification:", i.qualification.toString()),
//                           _buildRow("skills:", i.skills.toString()),
//                           _buildRow("apply_to:", i.apply_to.toString()),
//                           _buildRow("date:", i.date.toString()),
//                           _buildRow("interview_date:", i.interview_date.toString()),
//                           _buildRow("status:", i.status.toString()),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//
//
//           }
//         },
//
//
//       ),
//
//
//
//
//
//     ),);
//   }
// }
// Widget _buildRow(String label, String value) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 4),
//     child: Row(
//       children: [
//         SizedBox(
//           width: 100,
//           child: Text(
//             label,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(width: 5),
//         Flexible(
//           child: Text(
//             value,
//             style: TextStyle(
//               color: Colors.grey.shade800,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
//
//
// class Joke {
//   final String id;
//   final String compname;
//   final String jobname;
//   final String qualification;
//   final String skills;
//   final String apply_to;
//   final String date;
//   final String interview_date;
//   final String status;
//
//
//
//
//   Joke(this.id,this.compname,this.jobname, this.qualification,this.skills,this.apply_to,this.date,this.interview_date, this.status);
// //  print("hiiiii");
// }



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/student/stud_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(view_application_status());
}

class view_application_status extends StatelessWidget {
  const view_application_status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const view_application_status_sub(),
    );
  }
}

class view_application_status_sub extends StatefulWidget {
  const view_application_status_sub({Key? key}) : super(key: key);

  @override
  State<view_application_status_sub> createState() =>
      _view_application_status_subState();
}

class _view_application_status_subState
    extends State<view_application_status_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(
            prefs.getString("ip").toString() + "/user_view_application_status"),
        body: {"sid": prefs.getString('sid').toString()});

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["compname"].toString(),
        joke["jobname"],
        joke["qualification"].toString(),
        joke["skills"].toString(),
        joke["apply_to"].toString(),
        joke["date"].toString(),
        joke["interview_date"].toString(),
        joke["status"].toString(),
      );
      jokes.add(newJoke);
    }
    return jokes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "APPLICATION STATUS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>studhome()));
      }, icon: Icon(Icons.arrow_back)),
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
        child: Container(
          child: FutureBuilder(
            future: _getJokes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Container(
                    width: 300,
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
                        CircularProgressIndicator(
                          color: Color(0xFF3498db),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Loading Application Status...",
                          style: TextStyle(
                            color: Color(0xFF2c3e50),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var i = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 15,
                              spreadRadius: 3,
                            )
                          ],
                          border: Border.all(
                            color: Color(0xFF2c3e50),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header with gradient based on status
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  gradient: _getStatusGradient(i.status.toString()),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _getStatusColor(i.status.toString()).withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      _getStatusIcon(i.status.toString()),
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Text(
                                        i.compname.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              _buildRowBlue(
                                label: "Job Name:",
                                value: i.jobname.toString(),
                              ),
                              _buildRowBlue(
                                label: "Qualification:",
                                value: i.qualification.toString(),
                              ),
                              _buildRowBlue(
                                label: "Skills:",
                                value: i.skills.toString(),
                              ),
                              SizedBox(height: 15),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xFFf8f9fa),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0xFF3498db).withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Application Timeline",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // _buildRowBlue(
                                    //   label: "Apply To:",
                                    //   value: i.apply_to.toString(),
                                    // ),
                                    _buildRowBlue(
                                      label: "Application Date:",
                                      value: i.date.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Interview Date:",
                                      value: i.interview_date.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(i.status.toString()).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: _getStatusColor(i.status.toString()),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Status:",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(i.status.toString()),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        i.status.toString().toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRowBlue({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Color(0xFF2c3e50),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 5),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFf8f9fa),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Color(0xFF3498db).withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Text(
                value,
                style: TextStyle(
                  color: Color(0xFF34495e),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
      case 'accepted':
        return Color(0xFF27ae60); // Green
      case 'pending':
        return Color(0xFFf39c12); // Orange
      case 'rejected':
      case 'declined':
        return Color(0xFFe74c3c); // Red
      default:
        return Color(0xFF3498db); // Blue
    }
  }

  LinearGradient _getStatusGradient(String status) {
    Color baseColor = _getStatusColor(status);
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [baseColor, _darkenColor(baseColor, 0.2)],
    );
  }

  Color _darkenColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
      case 'accepted':
        return Icons.check_circle;
      case 'pending':
        return Icons.access_time;
      case 'rejected':
      case 'declined':
        return Icons.cancel;
      default:
        return Icons.work;
    }
  }
}

class Joke {
  final String id;
  final String compname;
  final String jobname;
  final String qualification;
  final String skills;
  final String apply_to;
  final String date;
  final String interview_date;
  final String status;

  Joke(this.id, this.compname, this.jobname, this.qualification, this.skills,
      this.apply_to, this.date, this.interview_date, this.status);
}
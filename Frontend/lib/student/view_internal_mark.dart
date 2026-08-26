// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
// void main()
// {
//   runApp(view_internal_mark());
// }
//
// class view_internal_mark extends StatelessWidget {
//   const view_internal_mark({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_internal_mark_sub(),);
//   }
// }
// class view_internal_mark_sub extends StatefulWidget {
//   const view_internal_mark_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_internal_mark_sub> createState() => _view_internal_mark_subState();
// }
//
// class _view_internal_mark_subState extends State<view_internal_mark_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_view_internal_mark"),
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
//           joke["internal_mark"],
//           joke["result"].toString(),
//           joke["total"].toString(),
//           joke["grade_point"].toString(),
//           joke["grade"].toString(),
//           joke["credit_point"].toString(),
//           joke["public_status"].toString(),
//           joke["sub_name"].toString(),
//           joke["description"].toString(),
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
//                           _buildRow("internal mark:", i.internal_mark.toString()),
//                           _buildRow("result:", i.result.toString()),
//                           _buildRow("total:", i.total.toString()),
//                           _buildRow("garde point:", i.grade_point.toString()),
//                           _buildRow("grade:", i.garde.toString()),
//                           _buildRow("credit point:", i.credit_point.toString()),
//                           _buildRow("public status:", i.public_status.toString()),
//                           _buildRow("subject name:", i.sub_name.toString()),
//                           _buildRow("description:", i.description.toString()),
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
//   final String internal_mark;
//   final String result;
//   final String total;
//   final String grade_point;
//   final String grade;
//   final String credit_point;
//   final String public_status;
//   final String sub_name;
//   final String description;
//
//
//
//
//   Joke(this.id,this.internal_mark, this.result,this.total,this.grade_point,this.grade,
//       this.credit_point,this.public_status,this.sub_name,this.description);
// //  print("hiiiii");
// }




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(view_internal_mark());
}

class view_internal_mark extends StatelessWidget {
  const view_internal_mark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const view_internal_mark_sub(),
    );
  }
}

class view_internal_mark_sub extends StatefulWidget {
  const view_internal_mark_sub({Key? key}) : super(key: key);

  @override
  State<view_internal_mark_sub> createState() => _view_internal_mark_subState();
}

class _view_internal_mark_subState extends State<view_internal_mark_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(
            prefs.getString("ip").toString() + "/user_view_internal_mark"),
        body: {"sid": prefs.getString('sid').toString()});

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["internal_mark"],
        joke["result"].toString(),
        joke["total"].toString(),
        joke["grade_point"].toString(),
        joke["grade"].toString(),
        joke["credit_point"].toString(),
        joke["public_status"].toString(),
        joke["sub_name"].toString(),
        joke["description"].toString(),
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
          "INTERNAL MARKS",
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
                          "Loading Internal Marks...",
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
              } else if (snapshot.data.isEmpty) {
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
                        Icon(
                          Icons.assignment,
                          size: 60,
                          color: Color(0xFF3498db),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "No Internal Marks Found",
                          style: TextStyle(
                            color: Color(0xFF2c3e50),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "You don't have any internal marks recorded yet.",
                          style: TextStyle(
                            color: Color(0xFF7f8c8d),
                            fontSize: 14,
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
                              // Header with gradient
                              Container(
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
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF3498db).withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.assessment,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Text(
                                        i.sub_name.toString(),
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
                                      "Marks Details",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Internal Mark:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF3498db)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.internal_mark.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Result:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF3498db)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.result.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Total:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF3498db)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.total.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                                      "Grade Details",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Grade Point:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF3498db)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.grade_point.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Grade:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF3498db)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.grade.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Credit Point:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF3498db)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.credit_point.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                                      "Additional Information",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Public Status:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF3498db)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.public_status.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Description:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF3498db)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.description.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
}

Widget _buildRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 5),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ],
    ),
  );
}

class Joke {
  final String id;
  final String internal_mark;
  final String result;
  final String total;
  final String grade_point;
  final String grade;
  final String credit_point;
  final String public_status;
  final String sub_name;
  final String description;

  Joke(
      this.id,
      this.internal_mark,
      this.result,
      this.total,
      this.grade_point,
      this.grade,
      this.credit_point,
      this.public_status,
      this.sub_name,
      this.description);
}
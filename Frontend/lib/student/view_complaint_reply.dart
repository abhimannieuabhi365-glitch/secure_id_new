// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
// void main()
// {
//   runApp(view_complaint_reply());
// }
//
// class view_complaint_reply extends StatelessWidget {
//   const view_complaint_reply({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_complaint_reply_sub(),);
//   }
// }
// class view_complaint_reply_sub extends StatefulWidget {
//   const view_complaint_reply_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_complaint_reply_sub> createState() => _view_company_reply_subState();
// }
//
// class _view_company_reply_subState extends State<view_complaint_reply_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_view_complaint_reply"),
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
//           joke["complaint"],
//           joke["c_date"].toString(),
//           joke["reply"].toString(),
//           joke["r_date"].toString()
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
//                         children: <Widget>[
//
//                           SizedBox(height: 10),
//                           _buildRow("Complaint:", i.complaint.toString()),
//                           _buildRow("complaint date:", i.c_date.toString()),
//                           _buildRow("Reply:", i.reply.toString()),
//                           _buildRow("reply date:", i.r_date.toString()),
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
//   final String complaint;
//   final String c_date;
//   final String reply;
//   final String r_date;
//
//
//
//
//   Joke(this.id,this.complaint, this.c_date,this.reply,this.r_date);
// //  print("hiiiii");
// }
//
//




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled1/student/stud_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(view_complaint_reply());
}

class view_complaint_reply extends StatelessWidget {
  const view_complaint_reply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const view_complaint_reply_sub(),
    );
  }
}

class view_complaint_reply_sub extends StatefulWidget {
  const view_complaint_reply_sub({Key? key}) : super(key: key);

  @override
  State<view_complaint_reply_sub> createState() =>
      _view_company_reply_subState();
}

class _view_company_reply_subState extends State<view_complaint_reply_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(
            prefs.getString("ip").toString() + "/user_view_complaint_reply"),
        body: {"sid": prefs.getString('sid').toString()});

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["complaint"],
        joke["c_date"].toString(),
        joke["reply"].toString(),
        joke["r_date"].toString(),
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
          "COMPLAINT REPLIES",
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
                          "Loading Complaint Replies...",
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
                          Icons.chat_bubble_outline,
                          size: 60,
                          color: Color(0xFF3498db),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "No Complaint Replies",
                          style: TextStyle(
                            color: Color(0xFF2c3e50),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "You haven't received any replies yet.",
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
                            children: <Widget>[
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
                                      Icons.chat_bubble,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      "Complaint Reply",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
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
                                      "Your Complaint",
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
                                              "Complaint:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF2c3e50),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
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
                                                i.complaint.toString(),
                                                style: TextStyle(
                                                  color: Color(0xFF34495e),
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
                                              "Date:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF2c3e50),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
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
                                                i.c_date.toString(),
                                                style: TextStyle(
                                                  color: Color(0xFF34495e),
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
                                    color: Color(0xFF27ae60).withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.reply,
                                          color: Color(0xFF27ae60),
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Admin Reply",
                                          style: TextStyle(
                                            color: Color(0xFF2c3e50),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
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
                                              "Reply:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF2c3e50),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF27ae60)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.reply.toString(),
                                                style: TextStyle(
                                                  color: Color(0xFF34495e),
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
                                              "Date:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF2c3e50),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Color(0xFF27ae60)
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                i.r_date.toString(),
                                                style: TextStyle(
                                                  color: Color(0xFF34495e),
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
  final String complaint;
  final String c_date;
  final String reply;
  final String r_date;

  Joke(this.id, this.complaint, this.c_date, this.reply, this.r_date);
}
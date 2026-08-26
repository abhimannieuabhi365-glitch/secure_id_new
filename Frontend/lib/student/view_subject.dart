// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:untitled/student/stud_home.dart';
// import 'package:untitled/student/view_mark.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// void main()
// {
//   runApp(view_subject());
// }
// class view_subject extends StatelessWidget {
//   const view_subject({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_subject_sub(),);
//   }
// }
// class view_subject_sub extends StatefulWidget {
//   const view_subject_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_subject_sub> createState() => _view_subject_subState();
// }
//
// class _view_subject_subState extends State<view_subject_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_view_subject"),
//         body: {"id":b}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["name"],
//         joke["description"].toString(),
//         joke["semester"].toString(),
//         joke["code"].toString(),
//         joke["credit"].toString(),
//         joke["max_mark"].toString(),
//         joke["title"].toString(),
//         joke["cdescription"].toString(),
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('subject'),leading: IconButton(onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>studhome()));
//       }, icon: Icon(Icons.arrow_back)),
//       ),
//       body:
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
//                           _buildRow("name:", i.name.toString()),
//                           _buildRow("description:", i.description.toString()),
//                           _buildRow("semester:", i.semester.toString()),
//                           _buildRow("code:", i.code.toString()),
//                           _buildRow("credit:", i.credit.toString()),
//                           _buildRow("max_mark:", i.max_mark.toString()),
//                           _buildRow("title:", i.title.toString()),
//                           _buildRow("course description:", i.cdescription.toString()),
//
//                           Row(children: [
//                             ElevatedButton(onPressed: () async {
//                             SharedPreferences sh=await SharedPreferences.getInstance();
//                             sh.setString('subid', i.id.toString());
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>view_mark()));
//                             }, child: Text('view arks'))
//                           ],)
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
//   final String name;
//
//   final String description;
//   final String semester;
//   final String code;
//   final String credit;
//   final String max_mark;
//   final String title;
//   final String cdescription;
//
//
//
//
//
//
//   Joke(this.id,this.name,this.description,this.semester,this.code,this.credit,this.max_mark, this.title, this.cdescription);
// //  print("hiiiii");
// }
//



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/student/stud_home.dart';
import 'package:untitled1/student/view_mark.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(view_subject());
}

class view_subject extends StatelessWidget {
  const view_subject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const view_subject_sub(),
    );
  }
}

class view_subject_sub extends StatefulWidget {
  const view_subject_sub({Key? key}) : super(key: key);

  @override
  State<view_subject_sub> createState() => _view_subject_subState();
}

class _view_subject_subState extends State<view_subject_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/user_view_subject"),
        body: {"sid": prefs.getString('sid').toString()});

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["name"],
        joke["description"].toString(),
        joke["semester"].toString(),
        joke["code"].toString(),
        joke["credit"].toString(),
        joke["max_mark"].toString(),
        joke["title"].toString(),
        joke["cdescription"].toString(),
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
          "SUBJECTS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => studhome()));
          },
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
        ),
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
                        "Loading Subjects...",
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
                                    Icons.subject,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      i.name.toString(),
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
                            _buildStyledRow("Name:", i.name.toString()),
                            _buildStyledRow("Description:", i.description.toString()),
                            _buildStyledRow("Semester:", i.semester.toString()),
                            _buildStyledRow("Code:", i.code.toString()),
                            _buildStyledRow("Credit:", i.credit.toString()),
                            _buildStyledRow("Max Mark:", i.max_mark.toString()),
                            _buildStyledRow("Course Title:", i.title.toString()),
                            _buildStyledRow("Course Description:", i.cdescription.toString()),
                            SizedBox(height: 20),
                            Center(
                              child: Container(
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
                                child: ElevatedButton(
                                  onPressed: () async {
                                    SharedPreferences sh =
                                    await SharedPreferences.getInstance();
                                    sh.setString('subid', i.id.toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => view_mark()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'View Marks',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
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
    );
  }
}

Widget _buildStyledRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFF3498db).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2c3e50),
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Color(0xFF3498db).withOpacity(0.1),
                  ),
                ),
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
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
  final String name;
  final String description;
  final String semester;
  final String code;
  final String credit;
  final String max_mark;
  final String title;
  final String cdescription;

  Joke(this.id, this.name, this.description, this.semester, this.code,
      this.credit, this.max_mark, this.title, this.cdescription);
}
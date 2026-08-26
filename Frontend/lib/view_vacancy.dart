//
//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'edit_vacancy.dart';
// void main()
// {
//   runApp(view_vacancy());
// }
//
//
// class view_vacancy extends StatelessWidget {
//   const view_vacancy({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_vacancy_sub(),);
//   }
// }
//
// class view_vacancy_sub extends StatefulWidget {
//   const view_vacancy_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_vacancy_sub> createState() => _view_vacancy_subState();
// }
//
// class _view_vacancy_subState extends State<view_vacancy_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage = "";
//     var data =
//     await http.post(
//         Uri.parse(prefs.getString("ip").toString() + "/cmpny_view_vacancy"),
//         body: {"compid": prefs.getString('compid').toString()}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["data"]) {
//       print(joke);
//       Joke newJoke = Joke(
//           joke["id"].toString(),
//           joke["jobname"],
//           joke["qualification"].toString(),
//           joke["skills"].toString(),
//           joke["experience"].toString(),
//           joke["apply_form"].toString(),
//           joke["apply_to"].toString()
//
//
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//
//
//       Container(
//
//         child:
//         FutureBuilder(
//           future: _getJokes(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
// //              print("snapshot"+snapshot.toString());
//             if (snapshot.data == null) {
//               return Container(
//                 child: Center(
//                   child: Text("Loading..."),
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var i = snapshot.data![index];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         side: BorderSide(color: Colors.grey.shade300),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             SizedBox(height: 10),
//                         _buildRow("id:", i.id.toString()),
//                           _buildRow("Jobname:", i.jobname.toString()),
//                             _buildRow("qualification:", i.qualification.toString()),
//                             _buildRow("skills:", i.skills.toString()),
//                             _buildRow("experience:", i.experience.toString()),
//                             _buildRow("apply_from:", i.apply_form.toString()),
//                             _buildRow("apply_to:", i.apply_to.toString()),
//
//                             Row(children: [
//                               ElevatedButton(onPressed: ()async{
//                                 Navigator.push(context,MaterialPageRoute(builder: (context)=>edit_vacancy_sub(
//                                   id:i.id.toString(),
//                                   jobname:i.jobname.Jobname.toString(),
//                                   qualification:i.qualification.qualification.toString(),
//                                   skills:i.skills.skills.toString(),
//                                   experience:i.experience.experience.toString(),
//                                   apply_form:i.apply_form..apply_form.toString(),
//                                   apply_to:i.apply_to.apply_to.toString(),
//
//
//
//                                 )));
//
//                               }, child:Text("edit")),
//
//                               ElevatedButton(onPressed: () async {
//                                 SharedPreferences sh=await SharedPreferences.getInstance();
//                                 var data=await http.post(Uri.parse('${sh.getString('ip')}/remove'),
//                                 body: {
//                                   'id':i.id.toString()
//                                 });
//                                 showDialog(context: context, builder: (context)=>AlertDialog(
//                                   title: Text('vacancy'),
//                                   content: Text('removed'),
//                                   actions: [
//                                     TextButton(onPressed: (){
//                                       Navigator.pop(context);
//                                     }, child: Text('ok'))
//                                   ],
//                                 ));
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>view_vacancy()));
//                               }, child: Text('remove'))
//
//
//                             ],)
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//
//
//         ),
//
//
//       ),
//
//     );
//   }
//
//   Widget _buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(width: 5),
//           Flexible(
//             child: Text(
//               value,
//               style: TextStyle(
//                 color: Colors.grey.shade800,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class Joke {
//   final String id;
//   final String jobname;
//
//   final String qualification;
//   final String skills;
//   final String experience;
//   final String apply_form;
//   final String apply_to;
//
//
//
//
//   Joke(this.id,this.jobname, this.qualification,this.skills,this.experience,this.apply_form,this.apply_to);
// //  print("hiiiii");
// }




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/student/view_application_status.dart';
import 'package:untitled1/view_application.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_vacancy.dart';

void main() {
  runApp(view_vacancy());
}

class view_vacancy extends StatelessWidget {
  const view_vacancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const view_vacancy_sub(),
    );
  }
}

class view_vacancy_sub extends StatefulWidget {
  const view_vacancy_sub({Key? key}) : super(key: key);

  @override
  State<view_vacancy_sub> createState() => _view_vacancy_subState();
}

class _view_vacancy_subState extends State<view_vacancy_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/cmpny_view_vacancy"),
        body: {"cid": prefs.getString('cid').toString()});

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["data"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["jobname"],
        joke["qualification"].toString(),
        joke["skills"].toString(),
        joke["experience"].toString(),
        joke["apply_form"].toString(),
        joke["apply_to"].toString(),
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
          "VIEW VACANCIES",
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
                          "Loading Vacancies...",
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
                                      Icons.work_outline,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Text(
                                        i.jobname.toString(),
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
                                      "Vacancy Details",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    _buildRowBlue(
                                      label: "ID:",
                                      value: i.id.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "NAME:",
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
                                    _buildRowBlue(
                                      label: "Experience:",
                                      value: i.experience.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Apply From:",
                                      value: i.apply_form.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Apply To:",
                                      value: i.apply_to.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Expanded(
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
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFF3498db)
                                                .withOpacity(0.3),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      edit_vacancy_sub(
                                                        id: i.id.toString(),
                                                        jobname: i.jobname
                                                            .toString(),
                                                        qualification:
                                                        i.qualification
                                                            .toString(),
                                                        skills:
                                                        i.skills.toString(),
                                                        experience:
                                                        i.experience
                                                            .toString(),
                                                        apply_form: i.apply_form
                                                            .toString(),
                                                        apply_to: i.apply_to
                                                            .toString(),
                                                      )));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "EDIT",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFe74c3c),
                                            Color(0xFFc0392b)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFe74c3c)
                                                .withOpacity(0.3),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          SharedPreferences sh =
                                          await SharedPreferences
                                              .getInstance();
                                          var data = await http.post(
                                              Uri.parse(
                                                  '${sh.getString('ip')}/remove'),
                                              body: {
                                                'id': i.id.toString()
                                              });
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                  'Vacancy',
                                                  style: TextStyle(
                                                    color:
                                                    Color(0xFF2c3e50),
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                                content: Text(
                                                  'Vacancy has been removed successfully.',
                                                  style: TextStyle(
                                                    color:
                                                    Color(0xFF2c3e50),
                                                  ),
                                                ),
                                                actions: [
                                                  Container(
                                                    decoration:
                                                    BoxDecoration(
                                                      gradient:
                                                      LinearGradient(
                                                        begin: Alignment
                                                            .topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Color(0xFF3498db),
                                                          Color(0xFF2980b9)
                                                        ],
                                                      ),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(8),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context);
                                                        setState(() {});
                                                      },
                                                      child: Text(
                                                        'OK',
                                                        style: TextStyle(
                                                          color:
                                                          Colors.white,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "REMOVE",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ),
                                  ElevatedButton(onPressed: () async {
                                    SharedPreferences sh=await SharedPreferences.getInstance();
                                    sh.setString('vid', i.id.toString());
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>view_application()));
                                  }, child: Text('view application'))
                                ],
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
}

class Joke {
  final String id;
  final String jobname;
  final String qualification;
  final String skills;
  final String experience;
  final String apply_form;
  final String apply_to;

  Joke(this.id, this.jobname, this.qualification, this.skills, this.experience,
      this.apply_form, this.apply_to);
}
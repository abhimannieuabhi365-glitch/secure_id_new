// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:untitled/student/stud_home.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// void main()
// {
//   runApp(studview_vacancy());
// }
//
// class studview_vacancy extends StatelessWidget {
//   const studview_vacancy({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: studview_vacancysub(),);
//   }
// }
// class studview_vacancysub extends StatefulWidget {
//   const studview_vacancysub({Key? key}) : super(key: key);
//
//   @override
//   State<studview_vacancysub> createState() => _studview_vacancysubState();
// }
//
// class _studview_vacancysubState extends State<studview_vacancysub> { Future<List<Joke>> _getJokes() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String b = prefs.getString("lid").toString();
//   String foodimage="";
//   var data =
//   await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_view_vacancy"),
//       body: {"compid":prefs.getString('compid').toString()}
//   );
//
//   var jsonData = json.decode(data.body);
// //    print(jsonData);
//   List<Joke> jokes = [];
//   for (var joke in jsonData["message"]) {
//     print(joke);
//     Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["name"],
//         joke["email"].toString(),
//         joke["phone"].toString(),
//         joke["proof"].toString(),
//         joke["jobname"].toString(),
//         joke["qualification"].toString(),
//         joke["skills"].toString(),
//         joke["experience"].toString(),
//         joke["apply_form"].toString(),
//         joke["apply_to"].toString(),
//
//   );
//     jokes.add(newJoke);
//   }
//   return jokes;
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('vacancy'),leading: IconButton(onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>studhome()));
//       }, icon: Icon(Icons.arrow_back)),),
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
//                         children:[
//
//                           SizedBox(height: 10),
//                           _buildRow("name:", i.name.toString()),
//                           _buildRow("email:", i.email.toString()),
//                           _buildRow("phone:", i.phone.toString()),
//                           _buildRow("proof:", i.proof.toString()),
//                           _buildRow("jobname:", i.jobname.toString()),
//                           _buildRow("qualification:", i.qualification.toString()),
//                           _buildRow("skills:", i.skills.toString()),
//                           _buildRow("experience:", i.experience.toString()),
//                           _buildRow("apply_form:", i.apply_form.toString()),
//                           _buildRow("apply_to:", i.apply_to.toString()),
//                           Row(children: [
//                             ElevatedButton(onPressed: () async {
//                               SharedPreferences sh=await SharedPreferences.getInstance();
//                               var data=await http.post(Uri.parse('${sh.getString('ip')}/user_applyvaccy'),
//                               body: {
//                                 'id':i.id.toString(),
//                                 'sid':sh.getString('sid').toString()
//                               });
//                               var d=json.decode(data.body);
//                               if(d['status']=='ok'){
//                                 showDialog(context: context, builder: (context)=>AlertDialog(
//                                   title: Text('vacancy'),
//                                   content: Text('applied successfully'),
//                                   actions: [
//                                     TextButton(onPressed: (){
//                                       Navigator.pop(context);
//                                     }, child: Text('ok'))
//                                   ],
//                                 ));
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>studview_vacancy()));
//                               }
//                             }, child: Text('apply'))
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
//   final String email;
//   final String phone;
//   final String proof;
//   final String jobname;
//   final String qualification;
//   final String skills;
//   final String experience;
//   final String apply_form;
//   final String apply_to;
//
//
//
//
//   Joke(this.id,this.name,this.email,this.phone,this.proof,this.jobname,this.qualification,this.skills,this.experience,this.apply_form,this.apply_to);
// //  print("hiiiii");
// }
//



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/student/stud_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(studview_vacancy());
}

class studview_vacancy extends StatelessWidget {
  const studview_vacancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const studview_vacancysub(),
    );
  }
}

class studview_vacancysub extends StatefulWidget {
  const studview_vacancysub({Key? key}) : super(key: key);

  @override
  State<studview_vacancysub> createState() => _studview_vacancysubState();
}

class _studview_vacancysubState extends State<studview_vacancysub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/user_view_vacancy"),
        body: {"compid": prefs.getString('compid').toString()});

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["jobname"].toString(),
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
          "JOB VACANCIES",
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
                                    Icons.work,
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
                                    "Job Requirements",
                                    style: TextStyle(
                                      color: Color(0xFF2c3e50),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  _buildStyledRow("Job Title:", i.jobname.toString()),
                                  _buildStyledRow("Qualification:", i.qualification.toString()),
                                  _buildStyledRow("Skills:", i.skills.toString()),
                                  _buildStyledRow("Experience:", i.experience.toString()),
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
                                    "Application Period",
                                    style: TextStyle(
                                      color: Color(0xFF2c3e50),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  _buildStyledRow("Apply From:", i.apply_form.toString()),
                                  _buildStyledRow("Apply To:", i.apply_to.toString()),
                                ],
                              ),
                            ),
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
                                    var data = await http.post(
                                        Uri.parse(
                                            '${sh.getString('ip')}/user_applyvaccy'),
                                        body: {
                                          'id': i.id.toString(),
                                          'sid': sh.getString('sid').toString()
                                        });
                                    var d = json.decode(data.body);
                                    if (d['status'] == 'ok') {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                              "Application Status",
                                              style: TextStyle(
                                                color: Color(0xFF2c3e50),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFf8f9fa),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                    size: 50,
                                                  ),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    'Applied Successfully!',
                                                    style: TextStyle(
                                                      color: Color(0xFF2c3e50),
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Your application has been submitted successfully.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF7f8c8d),
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
                                                  BorderRadius.circular(10),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  studview_vacancy()));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Apply Now',
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
              width: 120,
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

  final String jobname;
  final String qualification;
  final String skills;
  final String experience;
  final String apply_form;
  final String apply_to;

  Joke(this.id,this.jobname,
      this.qualification, this.skills, this.experience, this.apply_form,
      this.apply_to);
}
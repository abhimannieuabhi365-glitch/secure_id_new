//
//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
//
// void main()
// {
//
//   runApp(view_application());
// }
// class view_application extends StatelessWidget {
//   const view_application({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_application_sub(),);
//   }
// }
//
//
// class view_application_sub extends StatefulWidget {
//   const view_application_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_application_sub> createState() => _view_application_subState();
// }
//
// class _view_application_subState extends State<view_application_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/cmpny_view_application"),
//         body: {"id":b}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//           joke["id"].toString(),
//           joke["companyname"],
//           joke["companyemail"].toString(),
//           joke["companyphone"].toString(),
//           joke["companyplace"].toString(),
//         joke["companybio"].toString(),
//         joke["jobname"].toString(),
//         joke["qualification"].toString(),
//         joke["skills"].toString(),
//         joke["experience"].toString(),
//         joke["apply_form"].toString(),
//         joke["apply_to"].toString(),
//         joke["date"].toString(),
//         joke["interview_date"].toString(),
//
//
//
//
//
//
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
//                           _buildRow("companyname:", i.companyname.toString()),
//                           _buildRow("companyemail:", i.companyemail.toString()),
//                           _buildRow("companyphone:", i.companyphone.toString()),
//                           _buildRow("companyplace:", i.companyplace.toString()),
//                           _buildRow("companybio:", i.companybio.toString()),
//                           _buildRow("jobname:", i.jobname.toString()),
//                           _buildRow("qualification:", i.qualification.toString()),
//                           _buildRow("skills:", i.skills.toString()),
//                           _buildRow("experience:", i.experience.toString()),
//                           _buildRow("apply_form:", i.apply_form.toString()),
//                           _buildRow("apply_to:", i.apply_to.toString()),
//                           _buildRow("date:", i.date.toString()),
//                           _buildRow("interview_date:", i.interview_date.toString()),
//                           ElevatedButton(onPressed: ()async{
//                             SharedPreferences prefs=await SharedPreferences.getInstance();
//                            var data=await http.post(Uri.parse(prefs.getString("ip").toString()+"/accept_application"),
//                              body: {"id":i.id.toString()}
//                            );
//
//
//                           }, child:Text("accept")),
//                           ElevatedButton(onPressed: ()async{
//                             SharedPreferences prefs=await SharedPreferences.getInstance();
//                             var data=await http.post(Uri.parse(prefs.getString("ip").toString()+"/reject_application"),
//                                 body: {"id":i.id.toString()}
//                             );
//
//
//                           }, child:Text("reject")),
//
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
//   final String companyname;
//
//   final String companyemail;
//   final String companyphone;
//   final String companyplace;
//   final String companybio;
//   final String jobname;
//   final String qualification;
//   final String skills;
//   final String experience;
//   final String apply_form;
//   final String apply_to;
//   final String date;
//   final String interview_date;
//
//
//
//
//   Joke(this.id,this.companyname, this.companyemail,this.companyphone,this.companyplace,this.companybio,this.jobname,this.qualification,this.skills,this.experience,this.apply_form,this.apply_to,this.date,this.interview_date,);
// //  print("hiiiii");
// }








import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled1/userhome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(view_application());
}

class view_application extends StatelessWidget {
  const view_application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const view_application_sub(),
    );
  }
}

class view_application_sub extends StatefulWidget {
  const view_application_sub({Key? key}) : super(key: key);

  @override
  State<view_application_sub> createState() => _view_application_subState();
}

class _view_application_subState extends State<view_application_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/cmpny_view_application"),
        body: {"vid": prefs.getString('vid').toString()});

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
        joke["date"].toString(),
        joke["interview_date"].toString(),
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
          "VIEW APPLICATIONS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>userhome()));
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
                          "Loading Applications...",
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
                                      Icons.business,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),

                                  ],
                                ),
                              ),
                              SizedBox(height: 20),

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
                                      "Job Details",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    _buildRowBlue(
                                      label: "Job Name:",
                                      value: i.jobname.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Qualification:",
                                      value: i.qualification.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Skills Required:",
                                      value: i.skills.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Experience:",
                                      value: i.experience.toString(),
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
                                      "Application Timeline",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    _buildRowBlue(
                                      label: "Apply From:",
                                      value: i.apply_form.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Apply To:",
                                      value: i.apply_to.toString(),
                                    ),
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
                                          SharedPreferences prefs =
                                          await SharedPreferences
                                              .getInstance();
                                          var data = await http.post(
                                              Uri.parse(prefs
                                                  .getString("ip")
                                                  .toString() +
                                                  "/accept_application"),
                                              body: {"id": i.id.toString()});
                                          // Refresh the data
                                          setState(() {});
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
                                              Icons.check_circle,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "ACCEPT",
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
                                          SharedPreferences prefs =
                                          await SharedPreferences
                                              .getInstance();
                                          var data = await http.post(
                                              Uri.parse(prefs
                                                  .getString("ip")
                                                  .toString() +
                                                  "/reject_application"),
                                              body: {"id": i.id.toString()});
                                          // Refresh the data
                                          setState(() {});
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
                                              Icons.cancel,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "REJECT",
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
            width: 150,
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
  final String date;
  final String interview_date;

  Joke(
      this.id,
      this.jobname,
      this.qualification,
      this.skills,
      this.experience,
      this.apply_form,
      this.apply_to,
      this.date,
      this.interview_date,
      );
}
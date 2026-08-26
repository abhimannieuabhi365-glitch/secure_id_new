// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:untitled/update_interview_date.dart';
// import 'package:untitled/userhome.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
// void main(){
//   runApp(viewcandidate());
// }
//
// class viewcandidate extends StatelessWidget {
//   const viewcandidate({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: viewcandidatesub(),);
//   }
// }
//
// class viewcandidatesub extends StatefulWidget {
//   const viewcandidatesub({Key? key}) : super(key: key);
//
//   @override
//   State<viewcandidatesub> createState() => _viewcandidatesubState();
// }
//
// class _viewcandidatesubState extends State<viewcandidatesub> {
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var data = await http.post(Uri.parse("${prefs.getString("ip")}/viewcandidate"),
//         body: {"cid":prefs.getString("cid").toString()}
//     );
//     print(data);
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["Vacancy"].toString(),
//         joke["Candidate_Name"].toString(),
//         joke["Email"].toString(),
//         joke["Phone"].toString(),
//         joke["Place"].toString(),
//         joke["post"].toString(),
//         joke["pin"].toString(),
//         joke["date_of_birth"].toString(),
//         joke["joining_year"].toString(),
//         joke["roll"].toString(),
//         joke["course"].toString(),
//         joke["college_name"].toString(),
//
//
//
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>userhome()));
//           },
//         ),
//       ),
//       body:
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
//                   var i = snapshot.data[index];
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
//                             // pic.network(i.pic,height: 100,width: 100,),
//                             // proof.network(i.proof,height: 100,width: 100,),
//
//                             SizedBox(height: 10),
//                             // _buildRow("id:", i.id.toString()),
//                             _buildRow("Vacancy:", i.Vacancy.toString()),
//                             // _buildRow("image:", i.image.toString()),
//                             _buildRow("Candidate_Name:", i.Candidate_Name.toString()),
//                             _buildRow("Email:", i.Email.toString()),
//                             _buildRow("Phone:", i.Phone.toString()),
//                             _buildRow("Place:", i.Place.toString()),
//                             _buildRow("post:", i.post.toString()),
//                             _buildRow("pin:", i.pin.toString()),
//                             _buildRow("date of birth:", i.date_of_birth.toString()),
//                             _buildRow("joining year:", i.joining_year.toString()),
//                             _buildRow("roll number:", i.roll.toString()),
//                             _buildRow("course:", i.course.toString()),
//                             _buildRow("college:", i.college_name.toString()),
//
//                             SizedBox(height: 10,),
//                             Row(children: [
//                               ElevatedButton(onPressed: () async {
//                                 SharedPreferences sh=await SharedPreferences.getInstance();
//                                 sh.setString('applid', i.id.toString());
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>update_date()));
//                               }, child: Text('update interview date'))
//                             ],)
//
//
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//
//
//             }
//           },
//
//
//         ),
//
//
//
//
//
//       ),
//
//     );
//   }
// }
//
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
// class Joke{
//   final String id;
//   final String Vacancy;
//   final String Candidate_Name;
//   final String Email;
//   final String Phone;
//   final String Place;
//   final String post;
//   final String pin;
//   final String date_of_birth;
//   final String joining_year;
//   final String roll;
//   final String course;
//   final String college_name;
//
//   Joke(this.id,this.Vacancy,this.Candidate_Name,this.Email,this.Phone,this.Place, this.post, this.pin, this.date_of_birth, this.joining_year, this.roll, this.course, this.college_name);
// }
//




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/update_interview_date.dart';
import 'package:untitled1/userhome.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(viewcandidate());
}

class viewcandidate extends StatelessWidget {
  const viewcandidate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: viewcandidatesub(),
    );
  }
}

class viewcandidatesub extends StatefulWidget {
  const viewcandidatesub({Key? key}) : super(key: key);

  @override
  State<viewcandidatesub> createState() => _viewcandidatesubState();
}

class _viewcandidatesubState extends State<viewcandidatesub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = await http.post(
        Uri.parse("${prefs.getString("ip")}/viewcandidate"),
        body: {"cid": prefs.getString("cid").toString()});
    print(data);

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["Vacancy"].toString(),
        joke["Candidate_Name"].toString(),
        joke["Email"].toString(),
        joke["Phone"].toString(),
        joke["Place"].toString(),
        joke["post"].toString(),
        joke["pin"].toString(),
        joke["date_of_birth"].toString(),
        joke["joining_year"].toString(),
        joke["roll"].toString(),
        joke["course"].toString(),
        joke["college_name"].toString(),
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
          "VIEW CANDIDATES",
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => userhome()));
          },
        ),
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
                          "Loading Candidates...",
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
                    var i = snapshot.data[index];
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
                                      Icons.person,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Text(
                                        i.Candidate_Name.toString(),
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
                                label: "Vacancy:",
                                value: i.Vacancy.toString(),
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
                                      "Contact Information",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    _buildRowBlue(
                                      label: "Email:",
                                      value: i.Email.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Phone:",
                                      value: i.Phone.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Place:",
                                      value: i.Place.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Post:",
                                      value: i.post.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "PIN:",
                                      value: i.pin.toString(),
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
                                      "Educational Details",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    _buildRowBlue(
                                      label: "Date of Birth:",
                                      value: i.date_of_birth.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Joining Year:",
                                      value: i.joining_year.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Roll Number:",
                                      value: i.roll.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Course:",
                                      value: i.course.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "College:",
                                      value: i.college_name.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
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
                                  borderRadius: BorderRadius.circular(8),
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
                                    sh.setString('applid', i.id.toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                update_date()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "UPDATE INTERVIEW DATE",
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
  final String Vacancy;
  final String Candidate_Name;
  final String Email;
  final String Phone;
  final String Place;
  final String post;
  final String pin;
  final String date_of_birth;
  final String joining_year;
  final String roll;
  final String course;
  final String college_name;

  Joke(
      this.id,
      this.Vacancy,
      this.Candidate_Name,
      this.Email,
      this.Phone,
      this.Place,
      this.post,
      this.pin,
      this.date_of_birth,
      this.joining_year,
      this.roll,
      this.course,
      this.college_name);
}
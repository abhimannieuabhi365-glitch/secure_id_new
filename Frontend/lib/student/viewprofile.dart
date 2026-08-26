// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
// void main()
// {
//   runApp(view_profile());
// }
//
// class view_profile extends StatelessWidget {
//   const view_profile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_profile_sub(),);
//   }
// }
//
// class view_profile_sub extends StatefulWidget {
//   const view_profile_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_profile_sub> createState() => _view_profile_subState();
// }
//
// class _view_profile_subState extends State<view_profile_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_view_profile"),
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
//           joke["name"],
//           joke["email"].toString(),
//           joke["phone"].toString(),
//           joke["place"].toString(),
//           joke["post"].toString(),
//           joke["pin"].toString(),
//           joke["date_of_birth"].toString(),
//           joke["joining_year"].toString(),
//           joke["roll_number"].toString(),
//           joke["cname"].toString(),
//           joke["title"].toString(),
//           joke["description"].toString(),
//
//     );
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
//                           _buildRow("name:", i.name.toString()),
//                           _buildRow("email:", i.email.toString()),
//                           _buildRow("phone:", i.phone.toString()),
//                           _buildRow("place", i.place.toString()),
//                           _buildRow("post",i.post.toString()),
//                           _buildRow("pin", i.pin.toString()),
//                           _buildRow("date_of_birth", i.date_of_birth.toString()),
//                           _buildRow("joining_year", i.joining_year.toString()),
//                           _buildRow("roll_number", i.roll_number.toString()),
//                           _buildRow("college name", i.cname.toString()),
//                           _buildRow("course title", i.title.toString()),
//                           _buildRow("desciption", i.description.toString()),
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
//   final String place;
//   final String post;
//   final String pin;
//   final String date_of_birth;
//   final String joining_year;
//   final String roll_number;
//   final String cname;
//   final String title;
//   final String description;
//
//
//
//
//
//   Joke(this.id,this.name,this.email,this.phone,this.place,this.post,this.pin,
//       this.date_of_birth,this.joining_year,this.roll_number, this.cname,this.title, this.description);
// //  print("hiiiii");
// }







import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/student/stud_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(view_profile());
}

class view_profile extends StatelessWidget {
  const view_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const view_profile_sub(),
    );
  }
}

class view_profile_sub extends StatefulWidget {
  const view_profile_sub({Key? key}) : super(key: key);

  @override
  State<view_profile_sub> createState() => _view_profile_subState();
}

class _view_profile_subState extends State<view_profile_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/user_view_profile"),
        body: {"sid": prefs.getString('sid').toString()});

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];
    for (var joke in jsonData["message"]) {
      print(joke);
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["name"],
        joke["email"].toString(),
        joke["phone"].toString(),
        joke["place"].toString(),
        joke["post"].toString(),
        joke["pin"].toString(),
        joke["date_of_birth"].toString(),
        joke["joining_year"].toString(),
        joke["roll_number"].toString(),
        joke["cname"].toString(),
        joke["title"].toString(),
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
          "STUDENT PROFILE",
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
                          "Loading Profile...",
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
                          Icons.person_outline,
                          size: 60,
                          color: Color(0xFF3498db),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "No Profile Found",
                          style: TextStyle(
                            color: Color(0xFF2c3e50),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Profile information is not available.",
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
                                      "Personal Information",
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
                                            width: 120,
                                            child: Text(
                                              "Name:",
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
                                                i.name.toString(),
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
                                            width: 120,
                                            child: Text(
                                              "Date of Birth:",
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
                                                i.date_of_birth.toString(),
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
                                      "Contact Information",
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
                                            width: 120,
                                            child: Text(
                                              "Email:",
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
                                                i.email.toString(),
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
                                            width: 120,
                                            child: Text(
                                              "Phone:",
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
                                                i.phone.toString(),
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
                                      "Address Details",
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
                                            width: 120,
                                            child: Text(
                                              "Place:",
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
                                                i.place.toString(),
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
                                            width: 120,
                                            child: Text(
                                              "Post:",
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
                                                i.post.toString(),
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
                                            width: 120,
                                            child: Text(
                                              "PIN:",
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
                                                i.pin.toString(),
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
                                      "Academic Information",
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
                                            width: 120,
                                            child: Text(
                                              "Roll Number:",
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
                                                i.roll_number.toString(),
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
                                            width: 120,
                                            child: Text(
                                              "Joining Year:",
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
                                                i.joining_year.toString(),
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
                                      "College & Course",
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
                                            width: 120,
                                            child: Text(
                                              "College Name:",
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
                                                i.cname.toString(),
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
                                            width: 120,
                                            child: Text(
                                              "Course Title:",
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
                                                i.title.toString(),
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
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120,
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
  final String name;
  final String email;
  final String phone;
  final String place;
  final String post;
  final String pin;
  final String date_of_birth;
  final String joining_year;
  final String roll_number;
  final String cname;
  final String title;
  final String description;

  Joke(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.place,
      this.post,
      this.pin,
      this.date_of_birth,
      this.joining_year,
      this.roll_number,
      this.cname,
      this.title,
      this.description);
}
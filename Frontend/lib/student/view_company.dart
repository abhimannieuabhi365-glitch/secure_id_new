// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
//
// import '../view_vacancy.dart';
// void main()
// {
//   runApp(view_company());
// }
//
// class view_company extends StatelessWidget {
//   const view_company({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_company_sub(),);
//   }
// }
// class view_company_sub extends StatefulWidget {
//   const view_company_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_company_sub> createState() => _view_company_subState();
// }
//
// class _view_company_subState extends State<view_company_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_view_reply"),
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
//           joke["name"],
//           joke["email"].toString(),
//           joke["phone"].toString(),
//           joke["place"].toString(),
//           joke["post"].toString(),
//           joke["pin"].toString(),
//           prefs.getString('ip').toString()+joke["bio"].toString(),
//           prefs.getString('ip').toString()+joke["proof"].toString(),
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
//                           _buildRow(" name:", i.name.toString()),
//                           _buildRow("email:", i.email.toString()),
//                           _buildRow("phone:", i.phone.toString()),
//                           _buildRow("place:", i.place.toString()),
//                           _buildRow("post:", i.post.toString()),
//                           _buildRow("pin:", i.pin.toString()),
//                           Image.network(i.bio.toString()),
//                           Image.network(i.proof.toString()),
//                           Row(children: [
//                             ElevatedButton(onPressed: () async {
//                               SharedPreferences sh=await SharedPreferences.getInstance();
//                               sh.setString('compid', i.id.toString());
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>view_vacancy()));
//                             }, child: Text('view vacancy'))
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
//   final String place;
//   final String post;
//   final String pin;
//   final String bio;
//   final String proof;
//
//
//
//
//   Joke(this.id,this.name, this.email,this.phone,this.place,this.post,this.pin,this.bio,this.proof);
// //  print("hiiiii");
// }
//



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled1/student/view_vacancy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../view_vacancy.dart';

void main() {
  runApp(view_company());
}

class view_company extends StatelessWidget {
  const view_company({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const view_company_sub(),
    );
  }
}

class view_company_sub extends StatefulWidget {
  const view_company_sub({Key? key}) : super(key: key);

  @override
  State<view_company_sub> createState() => _view_company_subState();
}

class _view_company_subState extends State<view_company_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String b = prefs.getString("lid").toString();
    String foodimage = "";
    var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/user_view_company"),
        body: {"id": b});

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
        prefs.getString('ip').toString() + joke["bio"].toString(),
        prefs.getString('ip').toString() + joke["proof"].toString(),
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
          "VIEW COMPANIES",
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
                          "Loading Companies...",
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
                          Icons.business,
                          size: 60,
                          color: Color(0xFF3498db),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "No Companies Found",
                          style: TextStyle(
                            color: Color(0xFF2c3e50),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "There are no companies available at the moment.",
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
                                      Icons.business,
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
                                      "Company Details",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    _buildRowBlue(
                                      label: "Email:",
                                      value: i.email.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Phone:",
                                      value: i.phone.toString(),
                                    ),
                                    _buildRowBlue(
                                      label: "Place:",
                                      value: i.place.toString(),
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
                                      "Company Documents",
                                      style: TextStyle(
                                        color: Color(0xFF2c3e50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFF3498db),
                                          width: 1,
                                        ),
                                      ),
                                      child: i.bio.toString().contains('http')
                                          ? ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        child: Image.network(
                                          i.bio.toString(),
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child:
                                              CircularProgressIndicator(
                                                color: Color(0xFF3498db),
                                              ),
                                            );
                                          },
                                          errorBuilder: (context, error,
                                              stackTrace) {
                                            return Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .broken_image_outlined,
                                                    color:
                                                    Color(0xFF3498db),
                                                    size: 40,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "Bio Image",
                                                    style: TextStyle(
                                                      color: Color(
                                                          0xFF2c3e50),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                          : Center(
                                        child: Text(
                                          "No Bio Image",
                                          style: TextStyle(
                                            color: Color(0xFF7f8c8d),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFF3498db),
                                          width: 1,
                                        ),
                                      ),
                                      child: i.proof.toString().contains('http')
                                          ? ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        child: Image.network(
                                          i.proof.toString(),
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child:
                                              CircularProgressIndicator(
                                                color: Color(0xFF3498db),
                                              ),
                                            );
                                          },
                                          errorBuilder: (context, error,
                                              stackTrace) {
                                            return Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .broken_image_outlined,
                                                    color:
                                                    Color(0xFF3498db),
                                                    size: 40,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "Proof Image",
                                                    style: TextStyle(
                                                      color: Color(
                                                          0xFF2c3e50),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                          : Center(
                                        child: Text(
                                          "No Proof Image",
                                          style: TextStyle(
                                            color: Color(0xFF7f8c8d),
                                          ),
                                        ),
                                      ),
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
                                    sh.setString('compid', i.id.toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                studview_vacancy()));
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
                                        Icons.remove_red_eye,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "VIEW VACANCIES",
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
        )
    );
  }
}

class Joke {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String place;
  final String post;
  final String pin;
  final String bio;
  final String proof;

  Joke(this.id, this.name, this.email, this.phone, this.place, this.post,
      this.pin, this.bio, this.proof);
}
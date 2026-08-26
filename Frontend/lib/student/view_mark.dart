// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:untitled/student/stud_home.dart';
// import 'package:untitled/userhome.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// void main()
// {
//   runApp(view_mark());
// }
//
// class view_mark extends StatelessWidget {
//   const view_mark({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: view_mark_sub(),);
//   }
// }
// class view_mark_sub extends StatefulWidget {
//   const view_mark_sub({Key? key}) : super(key: key);
//
//   @override
//   State<view_mark_sub> createState() => _view_mark_subState();
// }
//
// class _view_mark_subState extends State<view_mark_sub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage="";
//     var data =
//     await http.post(Uri.parse(prefs.getString("ip").toString()+"/user_marks"),
//         body: {"sid":prefs.getString('sid').toString(),
//         'subid':prefs.getString('subid').toString()
//         }
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["internal_mark"],
//         joke["external_mark"],
//         joke["result"].toString(),
//         joke["total"].toString(),
//         joke["grade_point"].toString(),
//         joke["grade"].toString(),
//         joke["credit_point"].toString(),
//         joke["public_status"].toString(),
//
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('view subject'),leading: IconButton(onPressed: (){
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
//                         children: [
//
//                           SizedBox(height: 10),
//                           _buildRow("internal mark:", i.internal_mark.toString()),
//                           _buildRow("external mark:", i.external_mark.toString()),
//                           _buildRow("result:", i.result.toString()),
//                           _buildRow("total:", i.total.toString()),
//                           _buildRow("garde point:", i.grade_point.toString()),
//                           _buildRow("grade:", i.garde.toString()),
//                           _buildRow("credit point:", i.credit_point.toString()),
//                           _buildRow("public status:", i.public_status.toString()),
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
//   final String external_mark;
//   final String result;
//   final String total;
//   final String grade_point;
//   final String grade;
//   final String credit_point;
//   final String public_status;
//
//
//
//
//
//   Joke(this.id,this.internal_mark,this.external_mark, this.result,this.total,this.grade_point,this.grade,
//       this.credit_point,this.public_status);
// //  print("hiiiii");
// }




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/student/stud_home.dart';
import 'package:untitled1/userhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(view_mark());
}

class view_mark extends StatelessWidget {
  const view_mark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: view_mark_sub(),
    );
  }
}

class view_mark_sub extends StatefulWidget {
  const view_mark_sub({Key? key}) : super(key: key);

  @override
  State<view_mark_sub> createState() => _view_mark_subState();
}

class _view_mark_subState extends State<view_mark_sub> {
  Future<List<Joke>> _getJokes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var data = await http.post(
      Uri.parse(prefs.getString("ip").toString() + "/user_marks"),
      body: {
        "sid": prefs.getString('sid').toString(),
        'subid': prefs.getString('subid').toString()
      },
    );

    var jsonData = json.decode(data.body);
    List<Joke> jokes = [];

    for (var joke in jsonData["message"]) {
      Joke newJoke = Joke(
        joke["id"].toString(),
        joke["internal_mark"].toString(),
        joke["external_mark"].toString(),
        joke["result"].toString(),
        joke["total"].toString(),
        joke["grade_point"].toString(),
        joke["grade"].toString(),
        joke["credit_point"].toString(),
        joke["public_status"].toString(),
      );
      jokes.add(newJoke);
    }
    return jokes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Subject Marks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => studhome()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: _getJokes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var i = snapshot.data[index];
                  return Card(
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRow("Internal Mark", i.internal_mark),
                          _buildRow("External Mark", i.external_mark),
                          _buildRow("Result", i.result),
                          _buildRow("Total", i.total),
                          _buildRow("Grade Point", i.grade_point),
                          _buildRow("Grade", i.grade),
                          _buildRow("Credit Point", i.credit_point),
                          _buildRow("Public Status", i.public_status),
                        ],
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

Widget _buildRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        SizedBox(
          width: 130,
          child: Text(
            "$label :",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade700,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
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
  final String external_mark;
  final String result;
  final String total;
  final String grade_point;
  final String grade;
  final String credit_point;
  final String public_status;

  Joke(
      this.id,
      this.internal_mark,
      this.external_mark,
      this.result,
      this.total,
      this.grade_point,
      this.grade,
      this.credit_point,
      this.public_status,
      );
}

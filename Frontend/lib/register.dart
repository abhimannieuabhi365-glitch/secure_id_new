// //
// //
// //
// //
// //
// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// //
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;
// //
// // import 'LOFIN.dart';
// //
// // class register extends StatelessWidget{
// //   const register({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(home: registersub(),);
// //   }
// // }
// //
// //
// // class registersub extends StatefulWidget {
// //   const registersub({Key? key}) : super(key: key);
// //
// //   @override
// //   State<registersub> createState() => _registersubState();
// //
// // }
// //
// // class _registersubState extends State<registersub>{
// //   TextEditingController  name=TextEditingController();
// //   TextEditingController  email=TextEditingController();
// //   TextEditingController  phone=TextEditingController();
// //   TextEditingController  place=TextEditingController();
// //   TextEditingController  post=TextEditingController();
// //   TextEditingController  pin=TextEditingController();
// //   TextEditingController  bio=TextEditingController();
// //   TextEditingController  proof=TextEditingController();
// //   TextEditingController  password=TextEditingController();
// //   TextEditingController  repassword=TextEditingController();
// //
// //   PlatformFile? _selectedFile;
// //   Uint8List? _webFileBytes;
// //   String? _result;
// //   bool _isLoading = false;
// //
// //   // =====================================================
// //   // 📸 PICK FILE FUNCTION
// //   // =====================================================
// //   Future<void> _pickFile() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles(
// //       allowMultiple: false,
// //       type: FileType.any, // Any file type allowed
// //     );
// //
// //     if (result != null) {
// //       setState(() {
// //         _selectedFile = result.files.first;
// //         _result = null;
// //       });
// //
// //       if (kIsWeb) {
// //         _webFileBytes = result.files.first.bytes;
// //       }
// //     }
// //   }
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context){
// //     return Scaffold(
// //       body: Center(child: Column(children: [
// //         SizedBox(height: 30,width: 300,child: TextField(controller:name,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your name"),),),
// //         SizedBox(height: 30,width: 300,child: TextField(controller:email,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your email"),),),
// //         SizedBox(height: 30,width: 300,child: TextField(controller: phone,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your phone"),),),
// //         SizedBox(height: 30,width: 300,child: TextField(controller: place,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your place"),),),
// //         SizedBox(height: 30,width: 300,child: TextField(controller:post,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your post"),),),
// //         SizedBox(height: 30,width: 300,child: TextField(controller: pin,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your pin"),),),
// //         SizedBox(height: 30,width: 300,child: TextField(controller: bio,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter your bio"),),),
// //         SizedBox(height: 30,width: 300,child: TextField(controller: password,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "enter password"),),),
// //         SizedBox(height: 30,width: 300,child: TextField(controller: repassword,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "re enter password"),),),
// //         ElevatedButton.icon(
// //           icon: Icon(Icons.upload_file),
// //           label: Text("Select File"),
// //           onPressed: _pickFile,
// //         ),
// //         if (_selectedFile != null) ...[
// //           SizedBox(height: 10),
// //           Text("Selected: ${_selectedFile!.name}"),
// //         ],
// //         //
// //         ElevatedButton(onPressed: () async {
// //           SharedPreferences prefs=await SharedPreferences.getInstance();
// //           var request =  await http.MultipartRequest(
// //               'POST',
// //               Uri.parse('${prefs.getString('ip')}/cmpny_register')
// //           );
// //
// //           // 🔹 Normal Form Data
// //           request.fields['name'] = name.text;
// //           request.fields['email']= email.text;
// //           request.fields['phone'] = phone.text;
// //           request.fields['place'] = place.text;
// //           request.fields['post'] = post.text;
// //           request.fields['pin'] = pin.text;
// //           request.fields['bio'] = bio.text;
// //           request.fields['password'] = password.text;
// //           request.fields['repassword'] = repassword.text;
// //
// //
// //
// //
// //           // 🔹 File Upload Part
// //           if (kIsWeb) {
// //             request.files.add(http.MultipartFile.fromBytes(
// //               'file',
// //               _webFileBytes!,
// //               filename: _selectedFile!.name,
// //             ));
// //           } else {
// //             request.files.add(await http.MultipartFile.fromPath(
// //               'file',
// //               _selectedFile!.path!,
// //             ));
// //           }
// //           // =====================================================
// //           // 🌐 END SERVER UPLOAD SECTION
// //           // =====================================================
// //
// //           var response = await request.send();
// // Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
// //
// //         }, child: Text("Register"))
// //       ],),),
// //     );}
// //
// // }
// //
// //
//
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'LOFIN.dart';
//
// class register extends StatelessWidget {
//   const register({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: registersub(),
//       theme: ThemeData(
//         primaryColor: Color(0xFF007bff),
//         primaryColorDark: Color(0xFF0056b3),
//         backgroundColor: Color(0xFFf8f9fa),
//       ),
//     );
//   }
// }
//
// class registersub extends StatefulWidget {
//   const registersub({Key? key}) : super(key: key);
//
//   @override
//   State<registersub> createState() => _registersubState();
// }
//
// class _registersubState extends State<registersub> {
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController place = TextEditingController();
//   TextEditingController post = TextEditingController();
//   TextEditingController pin = TextEditingController();
//   TextEditingController bio = TextEditingController();
//   TextEditingController proof = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController repassword = TextEditingController();
//
//   PlatformFile? _selectedFile;
//   Uint8List? _webFileBytes;
//   String? _result;
//   bool _isLoading = false;
//
//   Future<void> _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.any,
//     );
//
//     if (result != null) {
//       setState(() {
//         _selectedFile = result.files.first;
//         _result = null;
//       });
//
//       if (kIsWeb) {
//         _webFileBytes = result.files.first.bytes;
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFf8f9fa),
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Icon(
//               Icons.book_rounded,
//               color: Colors.white,
//               size: 28,
//             ),
//             SizedBox(width: 10),
//             Text(
//               'DIGITAL WAVES',
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: 1,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Color(0xFF007bff),
//         elevation: 3,
//         centerTitle: false,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Header Card
//             Container(
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xFF007bff),
//                     Color(0xFF0056b3),
//                   ],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.person_add_alt_1_rounded,
//                     color: Colors.white,
//                     size: 48,
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     'CREATE ACCOUNT',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Register for Digital Waves platform',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white.withOpacity(0.9),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 20),
//
//             // Form Container
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       // Personal Information Section
//                       _buildSectionTitle('Personal Information'),
//
//                       // Name Field
//                       _buildTextField(
//                         controller: name,
//                         label: 'Full Name',
//                         icon: Icons.person_outline,
//                         hint: 'Enter your full name',
//                       ),
//
//                       // Email Field
//                       _buildTextField(
//                         controller: email,
//                         label: 'Email Address',
//                         icon: Icons.email_outlined,
//                         hint: 'Enter your email',
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//
//                       // Phone Field
//                       _buildTextField(
//                         controller: phone,
//                         label: 'Phone Number',
//                         icon: Icons.phone_outlined,
//                         hint: 'Enter your phone number',
//                         keyboardType: TextInputType.phone,
//                       ),
//
//                       // Address Section
//                       _buildSectionTitle('Address Information'),
//
//                       // Place Field
//                       _buildTextField(
//                         controller: place,
//                         label: 'City/Town',
//                         icon: Icons.location_city_outlined,
//                         hint: 'Enter your city/town',
//                       ),
//
//                       // Post Field
//                       _buildTextField(
//                         controller: post,
//                         label: 'Post Office',
//                         icon: Icons.local_post_office_outlined,
//                         hint: 'Enter your post office',
//                       ),
//
//                       // Pin Field
//                       _buildTextField(
//                         controller: pin,
//                         label: 'PIN Code',
//                         icon: Icons.location_on_outlined,
//                         hint: 'Enter PIN code',
//                         keyboardType: TextInputType.number,
//                       ),
//
//                       // Bio Field
//                       _buildTextField(
//                         controller: bio,
//                         label: 'Bio/Description',
//                         icon: Icons.description_outlined,
//                         hint: 'Enter your bio/description',
//                         maxLines: 3,
//                       ),
//
//                       // Security Section
//                       _buildSectionTitle('Security'),
//
//                       // Password Field
//                       _buildTextField(
//                         controller: password,
//                         label: 'Password',
//                         icon: Icons.lock_outline,
//                         hint: 'Enter password',
//                         obscureText: true,
//                       ),
//
//                       // Re-enter Password Field
//                       _buildTextField(
//                         controller: repassword,
//                         label: 'Confirm Password',
//                         icon: Icons.lock_outline,
//                         hint: 'Re-enter password',
//                         obscureText: true,
//                       ),
//
//                       // File Upload Section
//                       _buildSectionTitle('Document Verification'),
//
//                       Container(
//                         margin: EdgeInsets.only(bottom: 16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.attach_file_outlined,
//                                   color: Color(0xFF007bff),
//                                   size: 20,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'Upload Proof Document',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color(0xFF343a40),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             ElevatedButton.icon(
//                               icon: Icon(Icons.upload_file, color: Colors.white),
//                               label: Text("SELECT FILE"),
//                               onPressed: _pickFile,
//                               style: ElevatedButton.styleFrom(
//                                 primary: Color(0xFF6c757d),
//                                 padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                             ),
//                             if (_selectedFile != null) ...[
//                               SizedBox(height: 10),
//                               Container(
//                                 padding: EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFFe9f7fe),
//                                   borderRadius: BorderRadius.circular(8),
//                                   border: Border.all(color: Color(0xFF007bff), width: 1),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.file_present_outlined,
//                                       color: Color(0xFF007bff),
//                                     ),
//                                     SizedBox(width: 10),
//                                     Expanded(
//                                       child: Text(
//                                         "Selected: ${_selectedFile!.name}",
//                                         style: TextStyle(
//                                           color: Color(0xFF495057),
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ),
//                                     IconButton(
//                                       icon: Icon(Icons.close, color: Colors.red, size: 18),
//                                       onPressed: () {
//                                         setState(() {
//                                           _selectedFile = null;
//                                           _webFileBytes = null;
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ],
//                         ),
//                       ),
//
//                       SizedBox(height: 24),
//
//                       // Register Button
//                       Container(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             SharedPreferences prefs = await SharedPreferences.getInstance();
//                             var request = await http.MultipartRequest(
//                                 'POST',
//                                 Uri.parse('${prefs.getString('ip')}/cmpny_register')
//                             );
//
//                             // Form Data
//                             request.fields['name'] = name.text;
//                             request.fields['email'] = email.text;
//                             request.fields['phone'] = phone.text;
//                             request.fields['place'] = place.text;
//                             request.fields['post'] = post.text;
//                             request.fields['pin'] = pin.text;
//                             request.fields['bio'] = bio.text;
//                             request.fields['password'] = password.text;
//                             request.fields['repassword'] = repassword.text;
//
//                             // File Upload Part
//                             if (_selectedFile != null) {
//                               if (kIsWeb) {
//                                 request.files.add(http.MultipartFile.fromBytes(
//                                   'file',
//                                   _webFileBytes!,
//                                   filename: _selectedFile!.name,
//                                 ));
//                               } else {
//                                 request.files.add(await http.MultipartFile.fromPath(
//                                   'file',
//                                   _selectedFile!.path!,
//                                 ));
//                               }
//                             }
//
//                             var response = await request.send();
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xFF007bff),
//                             padding: EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             elevation: 2,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.app_registration_outlined,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 "REGISTER ACCOUNT",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   letterSpacing: 0.5,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20),
//
//             // Information Card
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.info_outline,
//                             color: Color(0xFF007bff),
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             'Registration Requirements',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFF343a40),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 12),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildInfoItem('• All fields are mandatory for registration'),
//                           _buildInfoItem('• Provide valid email and phone number'),
//                           _buildInfoItem('• Upload valid identification proof'),
//                           _buildInfoItem('• Keep your password secure and confidential'),
//                           _buildInfoItem('• You will be redirected to login after registration'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 40),
//
//             // Footer
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(20),
//               color: Color(0xFF343a40),
//               child: Column(
//                 children: [
//                   Text(
//                     'DIGITAL WAVES',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Secure document management with QR code technology',
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 14,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.facebook, color: Colors.white70, size: 20),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.settings_input_antenna, color: Colors.white70, size: 20),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.linked_camera, color: Colors.white70, size: 20),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.photo_camera, color: Colors.white70, size: 20),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     '© 2023 Digital Waves. All rights reserved.',
//                     style: TextStyle(
//                       color: Colors.white60,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Container(
//         margin: EdgeInsets.only(top: 16, bottom: 16),
//         child: Row(
//           children: [
//             Expanded(
//               child: Divider(
//                 color: Color(0xFFdee2e6),
//                 thickness: 1,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF007bff),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Divider(
//                 color: Color(0xFFdee2e6),
//                 thickness: 1,
//               ),
//             ),
//           ],
//         )
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     required String hint,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 icon,
//                 color: Color(0xFF007bff),
//                 size: 20,
//               ),
//               SizedBox(width: 8),
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF343a40),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           TextField(
//             controller: controller,
//             obscureText: obscureText,
//             keyboardType: keyboardType,
//             maxLines: maxLines,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Color(0xFFdee2e6)),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Color(0xFF007bff), width: 2),
//               ),
//               hintText: hint,
//               hintStyle: TextStyle(color: Color(0xFF6c757d)),
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoItem(String text) {
//     return Padding(
//         padding: EdgeInsets.only(bottom: 8),
//     child: Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Icon(
//     Icons.circle,
//     color: Color(0xFF007bff),
//     size: 8,
//     ),
//     SizedBox(width: 10),
//     Expanded(
//     child: Text(
//     text,
//     style: TextStyle(
//     color: Color(0xFF6c757d),
//     height: 1.5,
//     ),
//     ),
//     ),
//     ],
//     ));
//   }
// }


import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'LOFIN.dart';

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: registersub(),
      theme: ThemeData(
        primaryColor: Color(0xFF007bff),
        primaryColorDark: Color(0xFF0056b3),
        scaffoldBackgroundColor: Color(0xFFf8f9fa),
      ),
    );
  }
}

class registersub extends StatefulWidget {
  const registersub({Key? key}) : super(key: key);

  @override
  State<registersub> createState() => _registersubState();
}

class _registersubState extends State<registersub> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController post = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  PlatformFile? _selectedFile;
  Uint8List? _webFileBytes;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });

      if (kIsWeb) {
        _webFileBytes = result.files.first.bytes;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf8f9fa),
      appBar: AppBar(
        title: Text('DIGITAL WAVES'),
        backgroundColor: Color(0xFF007bff),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                    _buildTextField(
                      controller: name,
                      label: 'Full Name',
                      icon: Icons.person,
                      hint: 'Enter full name',
                      validator: (v) {
                        if (v!.isEmpty) return 'Name required';
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(v)) {
                          return 'Only letters allowed';
                        }
                        return null;
                      },
                    ),

                    _buildTextField(
                      controller: email,
                      label: 'Email',
                      icon: Icons.email,
                      hint: 'Enter email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v!.isEmpty) return 'Email required';
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(v)) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                    ),

                    _buildTextField(
                      controller: phone,
                      label: 'Phone',
                      icon: Icons.phone,
                      hint: '10 digit phone number',
                      keyboardType: TextInputType.number,
                      validator: (v) {
                        if (!RegExp(r'^\d{10}$').hasMatch(v!)) {
                          return 'Enter 10 digit phone number';
                        }
                        return null;
                      },
                    ),

                    _buildTextField(
                      controller: place,
                      label: 'Place',
                      icon: Icons.location_city,
                      hint: 'Enter place',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),

                    _buildTextField(
                      controller: post,
                      label: 'Post Office',
                      icon: Icons.local_post_office,
                      hint: 'Enter post office',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),

                    _buildTextField(
                      controller: pin,
                      label: 'PIN Code',
                      icon: Icons.pin_drop,
                      hint: '6 digit PIN',
                      keyboardType: TextInputType.number,
                      validator: (v) {
                        if (!RegExp(r'^\d{6}$').hasMatch(v!)) {
                          return 'Enter 6 digit PIN';
                        }
                        return null;
                      },
                    ),

                    _buildTextField(
                      controller: bio,
                      label: 'Bio',
                      icon: Icons.description,
                      hint: 'Enter bio',
                      maxLines: 3,
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),

                    _buildTextField(
                      controller: password,
                      label: 'Password',
                      icon: Icons.lock,
                      hint: 'Minimum 6 characters',
                      obscureText: true,
                      validator: (v) {
                        if (v!.length < 6) {
                          return 'Minimum 6 characters';
                        }
                        return null;
                      },
                    ),

                    _buildTextField(
                      controller: repassword,
                      label: 'Confirm Password',
                      icon: Icons.lock,
                      hint: 'Re-enter password',
                      obscureText: true,
                      validator: (v) {
                        if (v != password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10),

                    ElevatedButton.icon(
                      icon: Icon(Icons.upload_file),
                      label: Text('UPLOAD DOCUMENT'),
                      onPressed: _pickFile,
                    ),

                    if (_selectedFile != null)
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          _selectedFile!.name,
                          style: TextStyle(color: Colors.green),
                        ),
                      ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;

                        if (_selectedFile == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please upload document')),
                          );
                          return;
                        }

                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                        var request = http.MultipartRequest(
                          'POST',
                          Uri.parse('${prefs.getString('ip')}/cmpny_register'),
                        );

                        request.fields.addAll({
                          'name': name.text,
                          'email': email.text,
                          'phone': phone.text,
                          'place': place.text,
                          'post': post.text,
                          'pin': pin.text,
                          'bio': bio.text,
                          'password': password.text,
                          'repassword': repassword.text,
                        });

                        if (kIsWeb) {
                          request.files.add(
                            http.MultipartFile.fromBytes(
                              'file',
                              _webFileBytes!,
                              filename: _selectedFile!.name,
                            ),
                          );
                        } else {
                          request.files.add(
                            await http.MultipartFile.fromPath(
                              'file',
                              _selectedFile!.path!,
                            ),
                          );
                        }

                        var streamedResponse = await request.send();
                        var response = await http.Response.fromStream(streamedResponse);

                          var data = jsonDecode(response.body);

                          if (data['status'] == 'ok') {
                            // success → go to login
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Registered successfully')));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => login()),
                            );
                          }
                          else if (data['status'] == 'email') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Email already exists')),
                            );
                          }
                          else if (data['status'] == 'phone') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Phone number already exists')),
                            );
                          }



                      },
                      child: Text('REGISTER'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

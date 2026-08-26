import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';  // Add this import

class FrontCameraCapturePage extends StatefulWidget {
  const FrontCameraCapturePage({Key? key}) : super(key: key);

  @override
  State<FrontCameraCapturePage> createState() => _FrontCameraCapturePageState();
}

class _FrontCameraCapturePageState extends State<FrontCameraCapturePage> {
  File? _imageFile;
  bool _isLoading = false;
  String? _statusMessage;
  bool _isSuccess = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _captureImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 85,
        maxWidth: 800,
      );

      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
          _statusMessage = null; // Reset status message
        });
      }
    } catch (e) {
      _showErrorDialog("Camera Error", "Unable to access camera: ${e.toString()}");
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) {
      _showErrorDialog("No Image", "Please capture an image first");
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = null;
    });

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String serverUrl = sh.getString("ip") ?? "";

      if (serverUrl.isEmpty) {
        throw Exception("Server URL not configured");
      }

      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$serverUrl/process_image'), // Adjust this endpoint
      );

      // Add file to request
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          _imageFile!.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );

      // Add any additional data
      request.fields['timestamp'] = DateTime.now().toIso8601String();
      request.fields['device_type'] = 'flutter_mobile';
      request.fields['cert_id'] = sh.getString("cert_id") ?? "";

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body);

        setState(() {
          _isSuccess = decodedData['status'] == 'success';
          _statusMessage = decodedData['message'] ??
              (decodedData['status'] == 'success' ? 'Face recognized' : 'Fraud user');

          if (decodedData.containsKey('confidence_score')) {
            _statusMessage = '${_statusMessage}\nConfidence: ${(decodedData['confidence_score'] * 100).toStringAsFixed(1)}%';
          }
        });

        if (!_isSuccess) {
          _showErrorDialog("Processing Failed", _statusMessage!);
        }
      } else {
        _showErrorDialog("Server Error", "Failed to connect to server. Status: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog("Network Error", e.toString());
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _clearImage() {
    setState(() {
      _imageFile = null;
      _statusMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Capture & Verification'),
        backgroundColor: Color(0xFF0a58ca),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFe8f2fc),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.camera_front,
                      size: 50,
                      color: Color(0xFF0a58ca),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Front Camera Capture',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0a58ca),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Capture your image using front camera for verification',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),

              // Image Preview Section
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Captured Image',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Image Preview Container
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _imageFile == null ? Color(0xFFf5f5f5) : null,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _imageFile == null ? Color(0xFFe0e0e0) : Color(0xFF0a58ca),
                          width: 2,
                        ),
                      ),
                      child: _imageFile == null
                          ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 60,
                              color: Color(0xFF999999),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'No image captured',
                              style: TextStyle(
                                color: Color(0xFF999999),
                              ),
                            ),
                          ],
                        ),
                      )
                          : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Status Message
                    if (_statusMessage != null)
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: _isSuccess ? Color(0xFFd1fae5) : Color(0xFFfee2e2),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _isSuccess ? Color(0xFF10b981) : Color(0xFFef4444),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _isSuccess ? Icons.check_circle : Icons.error,
                              color: _isSuccess ? Color(0xFF10b981) : Color(0xFFef4444),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                _statusMessage!,
                                style: TextStyle(
                                  color: _isSuccess ? Color(0xFF065f46) : Color(0xFF991b1b),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Buttons Row
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _captureImage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0a58ca),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: Icon(Icons.camera_alt),
                            label: Text(
                              'Capture',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        if (_imageFile != null)
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _clearImage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF6b7280),
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: Icon(Icons.delete),
                              label: Text(
                                'Clear',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Upload Button
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : _uploadImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _imageFile != null ? Color(0xFF10b981) : Color(0xFF9ca3af),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: _isLoading
                      ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                      : Icon(Icons.cloud_upload),
                  label: Text(
                    _isLoading ? 'Processing...' : 'Verify & Upload',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Instructions
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFFfef3c7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb, color: Color(0xFFf59e0b)),
                        SizedBox(width: 10),
                        Text(
                          'Instructions:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFf59e0b),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. Make sure you have good lighting\n'
                          '2. Position your face in the center\n'
                          '3. Keep a neutral expression\n'
                          '4. Remove glasses if possible\n'
                          '5. Capture image and upload for verification',
                      style: TextStyle(
                        color: Color(0xFF92400e),
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
  }
}
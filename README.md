--> Secure ID Using QR

--> Overview

Secure ID Using QR is a certificate authentication and identity verification system designed to provide secure and real-time verification of digital certificates.

The system combines QR code-based certificate verification with facial recognition to verify both the authenticity of a certificate and the identity of the person presenting it.

The backend is developed using Python and Django with MySQL for database management, while the mobile application is developed using Flutter and Dart. OpenCV and facial recognition technologies are used for biometric identity verification.

--> Key Features

- QR code generation and certificate verification
- Secure certificate authentication
- Facial recognition-based identity verification
- Real-time certificate validation
- Student and company authentication
- Secure certificate and document management
- Flutter mobile application
- Django-based backend
- MySQL database integration

--> Technologies Used

--> Backend
- Python
- Django
- MySQL

--> Frontend
- Flutter
- Dart
- HTML
- CSS
- Bootstrap

--> Security and Verification
- QR Code
- OpenCV
- Facial Recognition

--> Mobile Application
- Flutter
- Dart
- Mobile Scanner
- Shared Preferences
- HTTP

--> How It Works

1. A certificate is created and stored through the Django backend.
2. A unique QR code is associated with the certificate.
3. The QR code can be scanned using the Flutter mobile application.
4. The application sends the certificate information to the Django backend.
5. The backend checks the certificate information against the database.
6. Facial recognition is used to verify the identity of the person presenting the certificate.
7. The verification result is returned to the application.

--> Project Structure

```text
Secure-ID/
├── APP/                  # Django application
├── Frontend/             # Flutter mobile application
├── media/                # Uploaded media files
├── secure_id_new/        # Django project configuration
├── templates/            # Django HTML templates
├── tools/                # Project utilities
├── manage.py             # Django management script
├── .gitignore
└── README.md

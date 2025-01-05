import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  String clientName;
  String clientEmail;
  String clientPhone;
  String subject;
  String message;

  // Constructor
  Contact({
    required this.clientName,
    required this.clientEmail,
    required this.clientPhone,
    required this.subject,
    required this.message,
  });

  // Method to convert the Contact object to a Map (for easier serialization)
  Map<String, dynamic> toMap() {
    return {
      'client_name': clientName,
      'client_email': clientEmail,
      'client_phone': clientPhone,
      'subject': subject,
      'message': message,
    };
  }

  // Method to create a Contact object from a Firestore document
  factory Contact.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Contact(
      clientName: data['client_name'] ?? '',
      clientEmail: data['client_email'] ?? '',
      clientPhone: data['client_phone'] ?? '',
      subject: data['subject'] ?? '',
      message: data['message'] ?? '',
    );
  }

  // Method to display the contact information
  @override
  String toString() {
    return 'Contact(clientName: $clientName, clientEmail: $clientEmail, clientPhone: $clientPhone, subject: $subject, message: $message)';
  }
}

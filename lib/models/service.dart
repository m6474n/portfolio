import 'package:flutter/widgets.dart';

class Service {
  final IconData icon;
  final String title;
  final String description;
  final List<String> tech;

  Service({
    required this.icon,
    required this.title,
    required this.description,
    required this.tech,
  });

  // Factory constructor for creating a new Service instance from a map
  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      icon: map['icon'] ,
      title: map['title'] as String,
      description: map['description'] as String,
      tech: List<String>.from(map['tech']),
    );
  }

  // Method to convert a Service instance to a map
  Map<String, dynamic> toMap() {
    return {
      'icon': icon,
      'title': title,
      'description': description,
      'tech': tech,
    };
  }
}


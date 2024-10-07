class Testimonial {
  final String image;
  final String clientName;
  final String clientCountry;
  final String clientCompany;
  final String message;

  Testimonial({
    required this.image,
    required this.clientName,
    required this.clientCountry,
    required this.clientCompany,
    required this.message,
  });

  // Factory constructor to create a Testimonial from JSON
  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      image: json['image'] ?? '',
      clientName: json['client_name'] ?? '',
      clientCountry: json['client_country'] ?? '',
      clientCompany: json['client_company'] ?? '',
      message: json['client_testimonials'] ?? '',
    );
  }

  // Method to convert a Testimonial to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'client_name': clientName,
      'client_country': clientCountry,
      'client_company': clientCompany,
      'client_testimonials': message,
    };
  }
}

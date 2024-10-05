class Experience {
  final String time;
  final List<Job> experience;

  Experience({required this.time, required this.experience});

  factory Experience.fromJson(Map<String, dynamic> json) {
    var experienceList = json['experience'] as List;
    List<Job> experience = experienceList.map((i) => Job.fromJson(i)).toList();

    return Experience(
      time: json['time'],
      experience: experience,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'experience': experience.map((job) => job.toJson()).toList(),
    };
  }
}

class Job {
  final String role;
  final String company;
  final String address;

  Job({required this.role, required this.company, required this.address});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      role: json['role'],
      company: json['company'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'company': company,
      'address': address,
    };
  }
}

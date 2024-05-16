import 'dart:convert';
import 'package:http/http.dart' as http;

class Student {
  final int id;
  final String name;
  final String email;

  Student({required this.id, required this.name, required this.email});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['stuname'],
      email: json['email'],
    );
  }
}

class Students {
  Future<List<Student>> fetchStudents() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/student/'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_database/models/student.dart';

class Database {
  final supabase = Supabase.instance.client;
  Future<List<Student>> getData() async {
    var response = await supabase.from("student").select();

    List<Student> studentList = [];
    for (var element in response) {
      studentList.add(Student.fromJson(element));
    }
    return studentList;
  }

  signup({required String email, required String password}) async {
    await supabase.auth.signUp(password: password, email: email);
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_database/pages/list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://bmtbmmcxkvjhebxtzlrj.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtdGJtbWN4a3ZqaGVieHR6bHJqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNTczNTQsImV4cCI6MjA0OTkzMzM1NH0.4Nl3SlOoEDw8g6pAz0CaqhVv9lUC99l_WdEpXQSCXEY",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ListPage());
  }
}

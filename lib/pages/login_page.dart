import 'package:flutter/material.dart';
import 'package:supabase_database/constants/spacing.dart';
import 'package:supabase_database/pages/list_page.dart';
import 'package:supabase_database/services/database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Signup",
              style: TextStyle(fontSize: 24),
            ),
            height24,
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: "enter email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
            height24,
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: "enter password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ))),
            ),
            height24,
            ElevatedButton(
                onPressed: () async {
                  try {
                    await Database().signup(
                        email: emailController.text,
                        password: passwordController.text);
                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListPage(),
                          ));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                ),
                child: const Text(
                  "signup",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_database/constants/spacing.dart';
import 'package:supabase_database/services/database.dart';
import 'package:supabase_database/widgets/card_widget.dart';
import 'package:supabase_database/widgets/text_input.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  void clearData() {
    nameController.clear();
    ageController.clear();
    salaryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent.shade200,
      ),
      body: FutureBuilder(
          future: Database().getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data![index];
                    return CardWidget(
                      age: item.age,
                      id: item.id,
                      name: item.name,
                      salary: item.salary,
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text("Error"),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextInput(
                            controller: nameController, labelText: "name"),
                        height24,
                        TextInput(controller: ageController, labelText: "age"),
                        height24,
                        TextInput(
                            controller: salaryController, labelText: "salary"),
                        height24,
                        ElevatedButton(
                            onPressed: () async {
                              try {
                                await Database().insertNewStudent(
                                    name: nameController.text,
                                    age: int.parse(ageController.text),
                                    salary:
                                        double.parse(salaryController.text));
                                if (context.mounted) {
                                  clearData();
                                  setState(() {});
                                  Navigator.pop(context);
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(e.toString()),
                                    duration: const Duration(seconds: 10),
                                  ));
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 10, 67, 180),
                            ),
                            child: const Text(
                              "Insert",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

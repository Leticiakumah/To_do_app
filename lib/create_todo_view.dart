import 'package:flutter/material.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);
  final GlobalKey<FormState> createTodoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CreateTodo"),
      ),
      body: Form(
        key: createTodoKey,
        child: ListView(
          children: [
            TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field must not be empty";
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Title"),
                )),
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "This Field must not be empty";
                }
              },
              decoration: const InputDecoration(
                label: Text("Description"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(8080));
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This Field must not be empty";
                      }
                    },
                    decoration:
                        const InputDecoration(label: Text("Start Date")),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This Field must not be empty";
                      }
                    },
                    decoration: const InputDecoration(label: Text("End Time")),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  if (createTodoKey.currentState!.validate()) {
                    //send to database
                  } else {
                    //dont send to database
                  }
                },
                child: const Text(
                  "Create",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

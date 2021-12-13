// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todoapp/create_todo_view.dart';
import 'package:todoapp/utilities.dart';

class MyTodo_app extends StatelessWidget {
  MyTodo_app({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> completedTask = [];

  final List<Map<String, dynamic>> mydatabase = [
    {
      'title': 'plan trip to Accra',
      'description': 'I will be going to Accra',
      'time': 'Yesterday',
      'isCompleted': false
    },
    {
      'title': 'Doing my project',
      'descriptoin': 'Will send it early in the morning',
      'time': 'tomorrow',
      'isCompleted': true
    },
    {
      'title': 'Grade assignment',
      'descriptoin': 'Grade the assignment before the ending of June',
      'time': 'Today',
      'isCompleted': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    for (var element in mydatabase) {
      if (element['isCompleted'] == true) {
        completedTask.add(element);
      }
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1633114072460-c7dd0b7c6161?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60"),
          ),
        ),
        title: Text(
          "My Task",
          style: TextStyle(color: Colors.indigo.shade900),
        ),
        actions: [
          Icon(Icons.filter_list, color: Colors.indigo.shade900),
          Icon(Icons.search, color: Colors.indigo.shade900)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: const [
          TodoWidget(
            task: "plan Trip to Canada",
            description: "I will be goin to Canada this week",
            time: "Tomorrow",
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        //This is the card at bottom of the home page showing
        //the completed task and number of completed task
        child: InkWell(
          onTap: () {
            //This is the bottom sheet that displays our completed
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return TodoWidget(
                            task: completedTask[index]['title'],
                            description: completedTask[index]['descriptoin'],
                            time: completedTask[index]['time']);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: completedTask.length);
                });
          },
          child: Card(
            color: const Color.fromRGBO(220, 229, 238, 1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle,
                      color: Color.fromRGBO(56, 53, 123, 1)),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Completed"),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color.fromRGBO(92, 98, 122, 1),
                  ),
                  const Spacer(),
                  Text(completedTask.length.toString())
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateTodo();
          }));
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

//This is the widget that contains the todo task
class TodoWidget extends StatelessWidget {
  const TodoWidget({
    Key? key,
    required this.task,
    required this.description,
    required this.time,
  }) : super(key: key);
  //This is the variable for the title
  final String task;
  final String description;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: Colors.white,
        child: ListTile(
            leading: Icon(
              Icons.check_circle_outline,
              color: paint(time),
            ),
            title: Text(
              task,
              style: const TextStyle(color: Colors.indigo),
            ),
            subtitle: Text(
              description,
              style: const TextStyle(color: Colors.purpleAccent),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Icon(
                  Icons.notifications,
                  color: paint(time),
                  size: 15,
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: paint(time),
                    fontSize: 10,
                  ),
                )
              ],
            )));
  }
}

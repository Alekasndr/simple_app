import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoList = [];
  late String userTodo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll([
      "Go in for sports",
      "Go to the shop",
      "Buy potato",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("To-do list"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.green,
                        )),
                    title: Text(todoList[index]),
                  ),
                ),
                onDismissed: (direction) {
                  todoList.removeAt(index);
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext builderContext) {
                return AlertDialog(
                  title: Text("Add element"),
                  content: TextField(
                    onChanged: (String value) {
                      userTodo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todoList.add(userTodo);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

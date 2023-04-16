import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _userTodo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext buildContext) {
      return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text("Menu"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 200)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: Text(
                "On Main",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(150, 80), //////// HERE
              ),
            )
          ],
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("To-do list"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: _menuOpen,
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("items").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) return Text("No notes");
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(snapshot.data!.docs[index].id),
                    child: Card(
                      child: ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection("items")
                                  .doc(snapshot.data!.docs[index].id)
                                  .delete();
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.green,
                            )),
                        title: Text(snapshot.data?.docs[index].get("item")),
                      ),
                    ),
                    onDismissed: (direction) {
                      FirebaseFirestore.instance
                          .collection("items")
                          .doc(snapshot.data!.docs[index].id)
                          .delete();
                    });
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext builderContext) {
                return AlertDialog(
                  title: Text("Add element"),
                  content: TextField(
                    onChanged: (String value) {
                      _userTodo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("items")
                              .add({"item": _userTodo});
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

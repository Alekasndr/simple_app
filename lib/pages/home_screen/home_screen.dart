import 'package:flutter/material.dart';
import 'package:simple_app/pages/home_screen/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('To-do list'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _homeBloc.menuOpen(context),
          )
        ],
      ),
      body: _createToDoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateToDoDialog(),
        backgroundColor: Colors.orangeAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  void _showCreateToDoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return AlertDialog(
          title: const Text('Add element'),
          content: TextField(
            onChanged: (String value) => _homeBloc.todoFieldUpdated(value),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => _homeBloc.saveTodo(context),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _createToDoList() {
    return StreamBuilder(
      stream: _homeBloc.todoStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('No notes');
        return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(snapshot.data!.docs[index].id),
              child: Card(
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () => _homeBloc.deleteTodo(snapshot.data!.docs[index].id),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.green,
                    ),
                  ),
                  title: Text(snapshot.data?.docs[index].get('item')),
                ),
              ),
              onDismissed: (_) => _homeBloc.deleteTodo(snapshot.data!.docs[index].id),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simple_app/pages/main_screen/main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = MainBloc();
    _mainBloc.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('To-do list'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                'Main Screen',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              StreamBuilder(
                stream: _mainBloc.dataStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const CircularProgressIndicator();
                  return Text(
                    'Number of To-Do items: ${snapshot.data!.size}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () => _mainBloc.todoOpen(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Next'),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              StreamBuilder<int>(
                stream: _mainBloc.timeStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const CircularProgressIndicator();
                  return Text(
                    'seconds: ${snapshot.data!}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

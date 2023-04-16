import 'package:flutter/material.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("To-do list"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                "Main Screan",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/todo');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Next")),
            ],
          ),
        ],
      ),
    );
  }
}

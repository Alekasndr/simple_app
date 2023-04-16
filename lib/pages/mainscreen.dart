import 'package:flutter/material.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("To-do list"),
          centerTitle: true,
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                "Main Screan",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/todo');
                  },
                  child: Text("Next"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  )),
            ],
          ),
        ]));
  }
}

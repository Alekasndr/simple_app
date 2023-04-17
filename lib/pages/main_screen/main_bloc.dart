import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainBloc {
  late Stream<QuerySnapshot<Map<String, dynamic>>> dataStream;

  late StreamController<int> _timeStreamController;

  Stream<int> get timeStream => _timeStreamController.stream;
  int _count = 0;

  void loadData() {
    dataStream = FirebaseFirestore.instance.collection('items').snapshots();
    _timeStreamController = StreamController<int>();
    _startTimer();
  }

  void _startTimer() async {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _timeStreamController.sink.add(_count++),
    );
  }

  void todoOpen(BuildContext context) {
    Navigator.pushNamed(context, '/todo');
  }
}

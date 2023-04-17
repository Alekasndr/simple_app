import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeBloc {
  late String _userTodo;

  Stream<QuerySnapshot<Map<String, dynamic>>> get todoStream =>
      FirebaseFirestore.instance.collection('items').snapshots();

  void menuOpen(BuildContext context) {
    Navigator.pushNamed(context, '/menu');
  }

  void todoFieldUpdated(String value) {
    _userTodo = value;
  }

  void saveTodo(BuildContext context) {
    FirebaseFirestore.instance.collection('items').add({'item': _userTodo});
    Navigator.of(context).pop();
  }

  void deleteTodo(String id) {
    FirebaseFirestore.instance
        .collection('items')
        .doc(id)
        .delete();
  }
}

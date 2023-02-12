import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["bismiilah"],
      ["Do Exercises"]
    ];
  }

  void loadData () {
    toDoList = _myBox.get("TODOLIST");
  }


  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
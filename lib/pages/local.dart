import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugasakhircrud_firebase/components/dialog.dart';
import 'package:tugasakhircrud_firebase/components/localCard.dart';
import 'package:tugasakhircrud_firebase/data/database.dart';


 

class local extends StatefulWidget {
  const local({super.key});

  @override
  State<local> createState() => _localState();
}

class _localState extends State<local> {

  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }


  final controller = TextEditingController();

  final _myBox = Hive.box('myBox');
  TodoDatabase db = TodoDatabase();

  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text]);
      controller.clear();
    });
    Navigator.of(context).pop();
     db.updateDataBase();
  }

  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO LOCAL'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),
       body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return localCard(
            taskName: db.toDoList[index][0],
          );
        },
      ),
    );
  }

void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller, 
          onSave: saveNewTask, 
          onCancel: () => Navigator.of(context).pop()
        );
      },
    );
  }

}
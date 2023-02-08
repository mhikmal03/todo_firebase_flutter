import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
final TextEditingController _titleController = TextEditingController();
final TextEditingController _descController = TextEditingController();
String type = '';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create",
                      style: TextStyle(
                          fontSize: 33,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "New Todo",
                      style: TextStyle(
                          fontSize: 33,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    label("Title"),
                    const SizedBox(
                      height: 12,
                    ),
                    title(context),
                    const SizedBox(
                      height: 12,
                    ),
                    label("Task Type"),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        task("Urgent", 0xffff6d6e),
                        const SizedBox(width: 8),
                        task("Planned", 0xff2bc8d9),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    label("Description"),
                    const SizedBox(
                      height: 12,
                    ),
                    desc(context),
                    const SizedBox(
                      height: 24,
                    ),
                    button(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget task(String label, int color) {
  return InkWell(
    onTap: () {
      setState(() {
        type = label;
      });
    },
    child: Chip(
      backgroundColor: type == label ? Colors.black :Color(color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(label,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
      labelPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
    ),
  );
}

Widget title(context) {
  return Container(
    height: 55,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        color: Color(0xff2a2e3d), borderRadius: BorderRadius.circular(15)),
    child: TextFormField(
      controller: _titleController,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Title",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          contentPadding: EdgeInsets.only(left: 20, right: 20)),
    ),
  );
}

Widget desc(context) {
  return Container(
    height: 150,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        color: Color(0xff2a2e3d), borderRadius: BorderRadius.circular(15)),
    child: TextFormField(
      controller: _descController,
      style: const TextStyle(color: Colors.grey),
      maxLines: null,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Title",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          contentPadding: const EdgeInsets.only(left: 20, right: 20)),
    ),
  );
}

Widget button(context) {
  return InkWell(
    onTap: () {
      FirebaseFirestore.instance
          .collection("todo_database")
          .add({
            "title": _titleController.text,
            "type": type,
            "description": _descController.text,
            });
      Navigator.pop(context);
    },
    child: Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: const Text('Submit',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600))),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff2bc8d9),
      ),
    ),
  );
}
}





Widget label(String label) {
  return Text(label,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ));
}



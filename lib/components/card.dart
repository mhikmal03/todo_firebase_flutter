import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class cardTodo extends StatelessWidget {
  const cardTodo({Key? key, required this.title, required this.checked, required this.color, required this.id}): super(key: key);
  final String id;
  final String title;
  final bool checked;
  final color;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        // Theme(
        //     data: ThemeData(
        //       primarySwatch: Colors.blue,
        //       unselectedWidgetColor: Color(0xff5e616a),
        //     ),
        //     child: Checkbox(
        //       activeColor: Color(0xfff6cf89),
        //       checkColor: Color(0xff0e3e26),
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(5)),
        //       value: checked,
        //       onChanged: (bool? value) {},
        //     )),
        Expanded(
          child: Container(
            height: 70,
            child: Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
              color: color,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Row(
                      
                      children: [
                        const SizedBox(width: 15,),
                        Container(
                          width: 36,
                          height: 33,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Icon(Icons.today_outlined),
                        ),
                        const SizedBox(width: 15,),
                        Text(title, style: const TextStyle(color: Colors.white, fontSize: 20),),
                        
                      ],
                      
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            FirebaseFirestore.instance.collection('todo_database').doc(id).delete();
                          },
                          child: const Icon(Icons.delete, color: Colors.white,)),
                      ],
                    )
                  ],
                ),
              ),
              
            ),
          ),
        )
      ]),
    );
  }
}

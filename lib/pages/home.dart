import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhircrud_firebase/components/card.dart';
import 'package:tugasakhircrud_firebase/pages/add.dart';
import 'package:tugasakhircrud_firebase/pages/view.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance.collection("Todo").snapshots();

Future getMembers() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection("todo_database").get();
    final documents = querySnapshot.docs;
    print(documents.length);
    return documents;
    
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => add()));
            },
            child: Icon(Icons.add),
          ),
          label: 'Add',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.purple,
        ),
      ]),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      //   child: FutureBuilder(
      //     future: getMembers(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         return ListView.builder(
      //           itemCount: snapshot.data.length,
      //           itemBuilder: (context, index) {
      //             Map<String, dynamic> document = snapshot.data[index].data() as Map<String, dynamic>;
      //             // return Text(snapshot.data[index].data()['type']);
      //             return InkWell(
      //               onTap: () {
      //                 Navigator.push(context, MaterialPageRoute(builder: (builder) => view(
      //                   id: snapshot.data[index].id
      //                 )));
      //               },
      //               child: cardTodo(
      //                 title: document['title'] == null ? "gaada" : document['title'],
      //                 checked: false,
      //               ),
      //             );
      //           },
      //         );
      //       } else {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //     },
      //   ),
      // ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("todo_database").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> document = snapshot.data?.docs[index].data() as Map<String, dynamic>;
              return InkWell(
                onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => 
                        view(id: snapshot.data!.docs[index].id)));
                    },
                child: cardTodo(
                  title: document['title'] != null ? document['title'] : "ga diisi :(",
                  checked: true,
                  color: document['type'] == 'Urgent' ? Colors.red : Colors.green,
                  id: snapshot.data!.docs[index].id
                ),
              );
            },
          );
        },
      )
    );
  }
}

import 'package:flutter/material.dart';


class localCard extends StatelessWidget {
  const localCard({super.key,  required this.taskName});

  final String taskName;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: false
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
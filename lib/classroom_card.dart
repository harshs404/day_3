import 'package:flutter/material.dart';

class ClassroomCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Stack(
          children: <Widget>[
            ListTile(
              title: Text("Data Structure"),
              subtitle: Text("Stacks,LinkedList, Hash"),
              trailing: CircleAvatar(),
            ),
          ],
        ),
    );
  }
}
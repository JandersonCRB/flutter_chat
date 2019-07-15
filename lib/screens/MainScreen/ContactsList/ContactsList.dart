import 'package:flutter/material.dart';
import '../ChatScreen/ChatScreen.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Person("Janderson"),
        Person("Angelo"),
        Person("Lima"),
      ],
    );
  }
}

class Person extends StatelessWidget {
  final String name;
  Person(this.name);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(this.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(),
          ),
        );
      },
    );
  }
}

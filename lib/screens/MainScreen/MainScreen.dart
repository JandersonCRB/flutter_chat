import 'package:flutter/material.dart';

import './ContactsList/ContactsList.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Rails Chat"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.photo_camera),
              ),
              Tab(
                text: "Conversas",
              ),
              Tab(
                text: "Contatos",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.camera),
            ContactsList(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}

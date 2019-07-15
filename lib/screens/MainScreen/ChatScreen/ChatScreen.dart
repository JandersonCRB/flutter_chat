import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            Text("Janderson"),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[Text("Ola")],
                ),
                Row(
                  children: <Widget>[Text("Tudo bem contigo?")],
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
//            decoration: ContainerDe,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            print("emojis");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: FloatingActionButton(
                    onPressed: () {
                      print("send");
                    },
                    child: Icon(
                      Icons.send,
                      size: 20,
                    ),
//                    child: Icon(Icons.mic),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

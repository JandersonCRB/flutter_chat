import 'package:flutter/material.dart';

import 'package:flutter_chat/screens/MainScreen/MainScreen.dart';
import 'package:flutter_chat/screens/auth/signUp.dart';

void main() => runApp(MyApp());

myInputDecoration({labelText = "", icon}) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Colors.white),
    labelText: labelText,
    labelStyle: TextStyle(
      color: Colors.white,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  void redirectToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'lib/chat_logo.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Wrap(
                  runSpacing: 20,
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: myInputDecoration(
                        labelText: "Email",
                        icon: Icons.mail,
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: myInputDecoration(
                        labelText: "Senha",
                        icon: Icons.lock,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        child: Text("Login",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            )),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        redirectToSignUp(context);
                      },
                      child: Center(
                        child: Text(
                          "Ainda não é cadastrado? Cadastre-se",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

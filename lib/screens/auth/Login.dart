import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/services/Network.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_chat/blocs/userBloc.dart';
import 'package:flutter_chat/screens/auth/signUp.dart';

import '../../block_provider.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  UserBloc userBloc;

  void redirectToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  Widget renderBtnChild(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: SizedBox(
          width: 15,
          height: 15,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    } else {}
    return Text(
      "Login",
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  void _login() {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    this.setState(() {
      _isLoading = true;
    });
    http.post(Uri.encodeFull(Network.baseUrl + 'login'), body: {
      "email": "jandersonangelo@hotmail.com",
      "password": "123456",
    }).then((resp) {
      Map<String, dynamic> body = jsonDecode(resp.body);
      this.setState(() {
        _isLoading = false;
      });
      userBloc.changeToken.add(body['token']);
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
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
                        child: renderBtnChild(context),
                        color: Colors.white,
                        onPressed: _login,
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

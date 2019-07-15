import 'package:flutter/material.dart';

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

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Center(
            child: Form(
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Cadastre-se",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: myInputDecoration(
                      labelText: "Nome",
                      icon: Icons.person,
                    ),
                  ),
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
                      child: Text("Cadastrar",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          )),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chat/helpers/validator.dart';

myInputDecoration({labelText = "", icon, suffixIcon}) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Colors.white),
    suffixIcon: suffixIcon,
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
  bool _hidePassword = true;

  void submit() {
    if (_formKey.currentState.validate()) {
      print("VALID");
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Theme(
          data: ThemeData(
            errorColor: Colors.yellow,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Center(
              child: Form(
                key: _formKey,
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
                      validator: Validator().required().build(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: myInputDecoration(
                        labelText: "Nome",
                        icon: Icons.person,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: Validator().email().build(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: myInputDecoration(
                        labelText: "Email",
                        icon: Icons.mail,
                      ),
                    ),
                    TextFormField(
                      obscureText: _hidePassword,
                      validator: Validator().min(6, msg: "Senha deve conter pelo menos 6 caracteres").build(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: myInputDecoration(
                          labelText: "Senha",
                          icon: Icons.lock,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              this.setState(() {
                                _hidePassword =! _hidePassword;
                              });
                            },
                          )),
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
                        onPressed: submit,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

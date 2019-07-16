import 'package:flutter/material.dart';
import 'package:flutter_chat/block_provider.dart';
import 'package:flutter_chat/blocs/userBloc.dart';
import 'package:flutter_chat/screens/auth/Login.dart';

import 'MainScreen/MainScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: AuthHandler(),
    );
  }
}

class AuthHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder<String>(
        stream: userBloc.outToken,
        initialData: '',
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.data.length <= 0) {
            return MyHomePage();
          }
          return MainScreen();
        });
  }
}

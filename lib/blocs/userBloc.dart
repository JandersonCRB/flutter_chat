import 'dart:async';

import '../block_provider.dart';

class UserBloc implements BlocBase {
  String _token = '';

  StreamController<String> _tokenController = StreamController<String>();
  Sink<String> get _inChange => _tokenController.sink;
  Stream<String> get outToken => _tokenController.stream;

  StreamController<String> _changeController = StreamController<String>();
  Sink<String> get changeToken => _changeController.sink;

  UserBloc() {
    _token = '';
    _changeController.stream.listen(_change);
  }

  @override
  void dispose() {
    _tokenController.close();
    _changeController.close();
  }

  void _change(data) {
    _token = data;
    _inChange.add(_token);
  }
}
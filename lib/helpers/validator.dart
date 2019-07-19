class Validator {
  List<String Function(String value)> validatorFunctions = List();

  Validator required({String msg: "Este campo é obrigatório"}) {
    validatorFunctions.add((value) {
      if (value.length <= 0) {
        return msg;
      }
      return null;
    });
    return this;
  }

  Validator email({String msg: "Email inválido"}) {
    validatorFunctions.add((value) {
      String emailRegex =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(emailRegex);
      if (!regex.hasMatch(value)) {
        return msg;
      }
      return null;
    });
    return this;
  }

  Validator min(int minLength, {String msg: "Campo muito curto"}) {
    validatorFunctions.add((value) {
      if (value.length <= minLength) {
        return msg;
      }
      return null;
    });
    return this;
  }

  String Function(String) build() {
    return (String value) {
      for(int i = 0; i < validatorFunctions.length;i++) {
        String result = validatorFunctions[i](value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}

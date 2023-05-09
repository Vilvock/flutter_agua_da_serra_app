import 'package:flutter_agua_da_serra_app/config/application_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/res/strings.dart';

class Validator {

  BuildContext context;

  Validator({Key? key, required this.context});

  bool validateEmail(String email) {
     if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
       return true;
     } else {
       ApplicationMessages(context: context).showMessage(Strings.email_denied);
       return false;
    }
  }

  bool validatePassword(String password) {
    if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(password)) {
      return true;
    } else {
      ApplicationMessages(context: context).showMessage(Strings.password_denied);
      return false;
    }
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/main_ui/login.dart';
import 'package:flutter_agua_da_serra_app/main_ui/onboarding.dart';
import 'package:flutter_agua_da_serra_app/main_ui/splash.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Água da Serra",
    initialRoute:'/ui/splash',
    color: OwnerColors.colorPrimary,
    routes: {
      '/ui/splash': (context) => Splash(),
      '/ui/onboarding': (context) => Onboarding(),
      '/ui/login': (context) => Login(),


    },
  ));
}
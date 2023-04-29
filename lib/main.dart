import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/ui/auth/login.dart';
import 'package:flutter_agua_da_serra_app/ui/auth/register.dart';
import 'package:flutter_agua_da_serra_app/ui/intro/onboarding.dart';
import 'package:flutter_agua_da_serra_app/ui/intro/splash.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/ui/main/home.dart';
import 'package:flutter_agua_da_serra_app/ui/main/menu/profile.dart';

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
      '/ui/register': (context) => Register(),
      '/ui/home': (context) => Home(),
      '/ui/profile': (context) => Profile(),

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text("Sending Message"),
      // ))

    },
  ));
}
import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/ui/auth/login.dart';
import 'package:flutter_agua_da_serra_app/ui/auth/pdf_viewer.dart';
import 'package:flutter_agua_da_serra_app/ui/auth/register.dart';
import 'package:flutter_agua_da_serra_app/ui/intro/onboarding.dart';
import 'package:flutter_agua_da_serra_app/ui/intro/splash.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/ui/main/home.dart';
import 'package:flutter_agua_da_serra_app/ui/main/menu/categories.dart';
import 'package:flutter_agua_da_serra_app/ui/main/menu/profile.dart';
import 'package:flutter_agua_da_serra_app/ui/main/product/product_detail.dart';

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
      '/ui/pdf_viewer': (context) => PdfViewer(),
      '/ui/categories': (context) => Categories(),
      '/ui/product_detail': (context) => ProductDetail(),

      //toast
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text("Sending Message"),
      // ))


      //lista horizontal
      // Container(
      //   height: 180,
      //   child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: /*numbersList.length*/ 2,
      //     itemBuilder: (context, index) {
      //       return Card(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(
      //               Dimens.minRadiusApplication),
      //         ),
      //         margin:
      //             EdgeInsets.all(Dimens.minMarginApplication),
      //         child: Container(
      //           width: MediaQuery.of(context).size.width * 0.80,
      //           padding:
      //               EdgeInsets.all(Dimens.paddingApplication),
      //         ),
      //       );
      //     },
      //   ),
      // ),
    },
  ));
}
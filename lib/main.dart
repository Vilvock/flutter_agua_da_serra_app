// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/auth/login.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/auth/register.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/intro/onboarding.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/intro/splash.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/checkout_flow/method_payment.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/checkout_flow/sucess.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/home.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/menu/address/user_addresses.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/menu/categories/categories.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/menu/categories/products.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/menu/categories/subcategories.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/menu/user/profile.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/main/product/product_detail.dart';
import 'package:flutter_agua_da_serra_app/ui/navigation/utilities/pdf_viewer.dart';

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
      '/ui/subcategories': (context) => SubCategories(),
      '/ui/products': (context) => Products(),
      '/ui/product_detail': (context) => ProductDetail(),
      '/ui/user_addresses': (context) => UserAddresses(),
      '/ui/method_payment': (context) => MethodPayment(),
      '/ui/sucess': (context) => Sucess()


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
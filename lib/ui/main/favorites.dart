import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';

class Favorites extends StatefulWidget {
  const Favorites ({Key? key}) : super(key: key);

  @override
  State<Favorites > createState() => _Favorites();
}

class _Favorites  extends State<Favorites > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Meus Favoritos", isVisibleBackButton: false),
        body: Container());
  }
}





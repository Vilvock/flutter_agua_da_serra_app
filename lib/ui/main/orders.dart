import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';

class Orders extends StatefulWidget {
  const Orders ({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _Orders();
}

class _Orders extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Meus Pedidos", isVisibleBackButton: false),
        body: Container());
  }
}





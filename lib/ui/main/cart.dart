import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';

class Cart extends StatefulWidget {
  const Cart ({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _Cart();
}

class _Cart extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Carrinho", isVisibleBackButton: false),
        body: Container());
  }
}





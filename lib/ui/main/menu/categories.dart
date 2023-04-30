import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';

class Categories extends StatefulWidget {
  const Categories ({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _Categories();
}

class _Categories extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Categorias", isVisibleBackButton: true),
        body: Container());
  }
}





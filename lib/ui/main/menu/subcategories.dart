import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';

class SubCategories extends StatefulWidget {
  const SubCategories ({Key? key}) : super(key: key);

  @override
  State<SubCategories> createState() => _SubCategories();
}

class _SubCategories extends State<SubCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Subcategorias", isVisibleBackButton: true),
        body: Container());
  }
}





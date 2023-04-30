import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/res/strings.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';
import 'package:flutter_agua_da_serra_app/ui/components/progress_hud.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _Orders();
}

class _Orders extends State<Orders> {
  bool _isLoading = false;

  // List<String> numbersList = ["1", "2", "3", "4",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: "Meus Pedidos", isVisibleBackButton: false),
      body: ProgressHUD(
        inAsyncCall: _isLoading,
        valueColor: AlwaysStoppedAnimation<Color>(OwnerColors.colorPrimary),
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: ListView.builder(
            itemCount: /*numbersList.length*/ 10,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimens.minRadiusApplication),
                ),
                margin: EdgeInsets.all(Dimens.minMarginApplication),
                child: Container(
                  padding: EdgeInsets.all(Dimens.paddingApplication),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              right: Dimens.minMarginApplication),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Dimens.minRadiusApplication),
                              child: Image.asset(
                                'images/person.jpg',
                                height: 90,
                                width: 90,
                              ))),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.shortLoremIpsum,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: Dimens.textSize6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: Dimens.minMarginApplication),
                            Text(
                              Strings.longLoremIpsum,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: Dimens.textSize5,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            Text(
                              "Ver detalhes",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: Dimens.textSize5,
                                color: OwnerColors.colorPrimaryDark,
                              ),
                            ),
                            SizedBox(height: Dimens.minMarginApplication),
                            Divider(
                              color: Colors.black12,
                              height: 2,
                              thickness: 1.5,
                            ),
                            SizedBox(height: Dimens.minMarginApplication),
                            Text(
                              "Em andamento",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: Dimens.textSize5,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {
      _isLoading = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sending Message"),
      ));
      _isLoading = false;
    });
  }

// Future<void> _pullRefresh() async {
//   List<String> freshNumbers = await NumberGenerator().slowNumbers();
//   setState(() {
//     numbersList = freshNumbers;
//   });
// }
}

// class NumberGenerator {
//   Future<List<String>> slowNumbers() async {
//     return Future.delayed(const Duration(milliseconds: 1000), () => numbers);
//   }
//
//   List<String> get numbers => List.generate(15, (index) => number);
//
//   String get number => Random().nextInt(99999).toString();
// }

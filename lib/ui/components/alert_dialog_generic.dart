import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';

class GenericAlertDialog extends StatefulWidget {
  String? title;
  String? content;
  TextButton? btnBack;
  TextButton? btnConfirm;

  GenericAlertDialog({
    Key? key,
    this.title,
    this.content,
    this.btnBack,
    this.btnConfirm,
  });

  // DialogGeneric({Key? key}) : super(key: key);

  @override
  State<GenericAlertDialog> createState() => _GenericAlertDialogState();
}

class _GenericAlertDialogState extends State<GenericAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 280,
            child: Card(
              color: OwnerColors.colorPrimaryDark,
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title!,
                      style: TextStyle(
                          fontSize: Dimens.textSize6,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          color: OwnerColors.colorPrimaryDark),
                    ),
                    Text(
                      widget.content!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Dimens.textSize4,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          color: OwnerColors.colorPrimaryDark),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [widget.btnBack!, widget.btnConfirm!],
                    )
                  ],
                ),
              ),
            )));
  }
}

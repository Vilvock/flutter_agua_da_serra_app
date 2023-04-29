import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool isVisibleBackButton;

  CustomAppBar({this.title: "", this.isVisibleBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: this.isVisibleBackButton,
      leading: _returnBackIcon(this.isVisibleBackButton, context),
      backgroundColor: Colors.white,
      elevation: Dimens.elevationApplication,
      titleSpacing: 0,
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: Dimens.marginApplication),
            child: Image.asset(
              'images/main_logo_2.png',
              height: AppBar().preferredSize.height,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: Dimens.minMarginApplication),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: Dimens.textSize7,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  IconButton? _returnBackIcon(bool isVisible, BuildContext context) {
    if (isVisible) {
      return IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
        onPressed: () => {
          if (Navigator.of(context).canPop())
            {Navigator.of(context).pop()}
          else
            {SystemNavigator.pop()}
        },
      );
    }

    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

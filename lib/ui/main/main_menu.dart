import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Menu Principal", isVisibleBackButton: false),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            // Expanded(
            Material(
                elevation: Dimens.elevationApplication,
                child: Container(
                  padding: EdgeInsets.all(Dimens.paddingApplication),
                  color: Colors.black12,
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(right: Dimens.marginApplication),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/person.jpg'),
                          radius: 32,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lorem Ipsum Nome",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: Dimens.textSize6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: Dimens.minMarginApplication),
                            Text(
                              "email@email.com.br",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: Dimens.textSize5,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            color: Colors.black38),
                        onPressed: () => {

                            Navigator.pushNamed(context, "/ui/profile")
                        },
                      )
                    ],
                  ),
                )),
            Container(
              padding: EdgeInsets.all(Dimens.maxPaddingApplication),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: Dimens.minMarginApplication),
                    child: IconButton(
                      icon:
                          Icon(Icons.pin_drop_outlined, color: Colors.black),
                      onPressed: () => {},
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Meus endereços",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: Dimens.textSize5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: Dimens.minMarginApplication),
                        Text(
                          "Atualize ou determine seu endereço principal",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: Dimens.textSize4,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black12,
              height: 2,
              thickness: 1.5,
              indent: Dimens.marginApplication,
              endIndent: Dimens.marginApplication,
            ),
            Container(
              padding: EdgeInsets.all(Dimens.maxPaddingApplication),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: Dimens.minMarginApplication),
                    child: IconButton(
                      icon:
                      Icon(Icons.category_outlined, color: Colors.black),
                      onPressed: () => {},
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categorias",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: Dimens.textSize5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: Dimens.minMarginApplication),
                        Text(
                          "Visualize categorias de ofertas",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: Dimens.textSize4,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black12,
              height: 2,
              thickness: 1.5,
              indent: Dimens.marginApplication,
              endIndent: Dimens.marginApplication,
            ),
            Container(
              padding: EdgeInsets.all(Dimens.maxPaddingApplication),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: Dimens.minMarginApplication),
                    child: IconButton(
                      icon:
                      Icon(Icons.contact_support_outlined, color: Colors.black),
                      onPressed: () => {},
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Suporte",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: Dimens.textSize5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: Dimens.minMarginApplication),
                        Text(
                          "Contacte o suporte",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: Dimens.textSize4,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black12,
              height: 2,
              thickness: 1.5,
              indent: Dimens.marginApplication,
              endIndent: Dimens.marginApplication,
            ),
            Container(
              padding: EdgeInsets.all(Dimens.maxPaddingApplication),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: Dimens.minMarginApplication),
                    child: IconButton(
                      icon:
                      Icon(Icons.login_outlined, color: Colors.black),
                      onPressed: () => {},
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deslogar desta conta",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: Dimens.textSize5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: Dimens.minMarginApplication),
                        Text(
                          "Deslogar desta conta",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: Dimens.textSize4,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black12,
              height: 2,
              thickness: 1.5,
              indent: Dimens.marginApplication,
              endIndent: Dimens.marginApplication,
            ),
          ],
        ),
      ),
    );
  }
}

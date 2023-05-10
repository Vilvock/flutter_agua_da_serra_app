import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agua_da_serra_app/global/application_constant.dart';
import 'package:flutter_agua_da_serra_app/model/user.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';
import 'package:flutter_agua_da_serra_app/ui/main/home.dart';
import 'package:flutter_agua_da_serra_app/web_service/links.dart';
import 'package:flutter_agua_da_serra_app/web_service/service_response.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
  }

  late final validator;
  final postRequest = PostRequest();
  User? _profileResponse;


  Future<void> updateUserDataRequest(String email, String password) async {
    try {
      final body = {
        "email": email,
        "password": password,
        "token": ApplicationConstant.TOKEN
      };

      print('HTTP_BODY: $body');

      final json = await postRequest.sendPostRequest(Links.UPDATE_USER_DATA, body);
      // final parsedResponse = jsonDecode(json); // pegar um objeto so

      List<Map<String, dynamic>> _map = [];
      _map = List<Map<String, dynamic>>.from(jsonDecode(json));

      print('HTTP_RESPONSE: $_map');

      final response = User.fromJson(_map[0]);

      if(response.status == "01") {
        setState(() {
          _profileResponse = response;

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()),
              ModalRoute.withName("/ui/home"));
        });
      } else {

      }

    } catch (e) {
      setState(() {
        print('HTTP_ERROR: $e');
      });

    }
  }

  Future<void> loadProfileRequest(String email, String password) async {
    try {
      final body = {
        "email": email,
        "password": password,
        "token": ApplicationConstant.TOKEN
      };

      print('HTTP_BODY: $body');

      final json = await postRequest.sendPostRequest(Links.LOAD_PROFILE, body);
      // final parsedResponse = jsonDecode(json); // pegar um objeto so

      List<Map<String, dynamic>> _map = [];
      _map = List<Map<String, dynamic>>.from(jsonDecode(json));

      print('HTTP_RESPONSE: $_map');

      final response = User.fromJson(_map[0]);

      if(response.status == "01") {
        setState(() {
          _profileResponse = response;

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()),
              ModalRoute.withName("/ui/home"));
        });
      } else {

      }

    } catch (e) {
      setState(() {
        print('HTTP_ERROR: $e');
      });

    }
  }

  Future<void> updatePasswordRequest(String email, String password) async {
    try {
      final body = {
        "email": email,
        "password": password,
        "token": ApplicationConstant.TOKEN
      };

      print('HTTP_BODY: $body');

      final json = await postRequest.sendPostRequest(Links.UPDATE_PASSWORD, body);
      // final parsedResponse = jsonDecode(json); // pegar um objeto so

      List<Map<String, dynamic>> _map = [];
      _map = List<Map<String, dynamic>>.from(jsonDecode(json));

      print('HTTP_RESPONSE: $_map');

      final response = User.fromJson(_map[0]);

      if(response.status == "01") {
        setState(() {
          _profileResponse = response;

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()),
              ModalRoute.withName("/ui/home"));
        });
      } else {

      }

    } catch (e) {
      setState(() {
        print('HTTP_ERROR: $e');
      });

    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Meu Perfil", isVisibleBackButton: true),
        body: Container(
            child: Container(
              child: Column(children: [
                Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(Dimens.marginApplication),
                        child: Column(
                          children: [
                            Container(
                                width: 128,
                                height: 128,
                                margin:
                                EdgeInsets.only(right: Dimens.marginApplication),
                                child: Stack(alignment: Alignment.center, children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/person.jpg'),
                                    radius: 64,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: FloatingActionButton(
                                      mini: true,
                                      child:
                                      Icon(Icons.camera_alt, color: Colors.black),
                                      backgroundColor: Colors.white,
                                      onPressed: () {
                                        // Add your onPressed code here!
                                      },
                                    ),
                                  )
                                ])),
                            SizedBox(height: Dimens.marginApplication),
                            TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: OwnerColors.colorPrimary, width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'Nome',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Dimens.radiusApplication),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.all(Dimens.textFieldPaddingApplication),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimens.textSize5,
                              ),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: OwnerColors.colorPrimary, width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'E-mail',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Dimens.radiusApplication),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.all(Dimens.textFieldPaddingApplication),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimens.textSize5,
                              ),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: OwnerColors.colorPrimary, width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'Data de nascimento',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Dimens.radiusApplication),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.all(Dimens.textFieldPaddingApplication),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimens.textSize5,
                              ),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: OwnerColors.colorPrimary, width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'Celular',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Dimens.radiusApplication),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.all(Dimens.textFieldPaddingApplication),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimens.textSize5,
                              ),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: OwnerColors.colorPrimary, width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'CPF',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Dimens.radiusApplication),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.all(Dimens.textFieldPaddingApplication),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimens.textSize5,
                              ),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            Container(
                              margin: EdgeInsets.only(
                                  top: Dimens.marginApplication,
                                  bottom: Dimens.marginApplication),
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        OwnerColors.colorPrimary),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Atualizar dados",
                                    style: TextStyle(
                                        fontSize: Dimens.textSize8,
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  )),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: Dimens.marginApplication),
                              child: Text(
                                "Alterar Senha",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: Dimens.textSize6,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: OwnerColors.colorPrimary, width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'Nova Senha',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Dimens.radiusApplication),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.all(Dimens.textFieldPaddingApplication),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimens.textSize5,
                              ),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: OwnerColors.colorPrimary, width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'Confirmar Senha',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Dimens.radiusApplication),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.all(Dimens.textFieldPaddingApplication),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimens.textSize5,
                              ),
                            ),
                            SizedBox(height: Dimens.marginApplication),
                            Container(
                              margin: EdgeInsets.only(top: Dimens.marginApplication),
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        OwnerColors.colorPrimary),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Atualizar senha",
                                    style: TextStyle(
                                        fontSize: Dimens.textSize8,
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )),
              ]),
            )));
  }
}

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agua_da_serra_app/global/application_constant.dart';
import 'package:flutter_agua_da_serra_app/model/user.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/ui/auth/register.dart';
import 'package:flutter_agua_da_serra_app/ui/main/home.dart';
import 'package:flutter_agua_da_serra_app/web_service/service_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom_app_bar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return loginScreen();
  }

  String _response = '';
  final postRequest = PostRequest();
  User? _user;

  @override
  void initState() {
    super.initState();
    makePostRequest();
  }

  Future<void> makePostRequest() async {
    try {
      final body = {
        "email": "carlos@teste.com.br",
        "password": "123456",
        "token": "J4HQi3e0"
      };

      final response = await postRequest.sendPostRequest("usuarios/login/", body);
      final parsedResponse = jsonDecode(response);
      final user = User.fromJson(parsedResponse);
      setState(() {
        _response = response;
        _user = user;
        saveUserToPreferences(user);
      });
    } catch (e) {
      setState(() {
        _response = 'Erro durante a solicitação POST: $e';
      });
      print('Erro durante a solicitação POST: $e');
    }
  }

  Future<void> saveUserToPreferences(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = user.toJson();
    await prefs.setString('user', jsonEncode(userData));
  }
}

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.all(Dimens.marginApplication),
        child: Column(
          children: [
            Expanded(child: Container (
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Olá, \nRealize seu login",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: Dimens.textSize8,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 32),
                    TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: OwnerColors.colorPrimary, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
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
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: 'Senha',
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


                    Container(
                      margin: EdgeInsets.only(top: Dimens.minMarginApplication),
                      width: double.infinity,
                      child: Text(
                        "Esqueceu sua senha?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize:Dimens.textSize5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: Dimens.marginApplication),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle (
                            backgroundColor: MaterialStateProperty.all(OwnerColors.colorPrimary),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()),
                                ModalRoute.withName("/ui/home"));

                          },
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                                fontSize: Dimens.textSize8,
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                          )),
                    ),

                    Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: GestureDetector(
                              child: Text(
                                "Ainda não possui uma conta? Entre aqui",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Dimens.textSize5,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/ui/register");
                              })),
                    ),
                  ],
                ),
            ))
          ],
        ),
      ),
    );
  }
}

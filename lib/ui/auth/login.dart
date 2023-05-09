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
  void initState() {
    super.initState();
  }

  String _response = '';
  final postRequest = PostRequest();
  User? _loginResponse;


  Future<void> loginRequest(String email, String password) async {
    try {
      final body = {
        "email": email,
        "password": password,
        "token": ApplicationConstant.TOKEN
      };

      print('HTTP_BODY: $body');

      final json = await postRequest.sendPostRequest("usuarios/login/", body);
      // final parsedResponse = jsonDecode(json); // pegar um objeto so

      List<Map<String, dynamic>> _map = [];
      _map = List<Map<String, dynamic>>.from(jsonDecode(json));

      print('HTTP_RESPONSE: $_map');

      final response = User.fromJson(_map[0]);

      if(response.status == "01") {
        setState(() {
          _loginResponse = response;
          saveUserToPreferences(_loginResponse!);

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
        _response = 'HTTP_ERROR: $e';
      });
      print(_response);

    }
  }

  Future<void> saveUserToPreferences(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = user.toJson();
    await prefs.setString('user', jsonEncode(userData));
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
                    controller: emailController,
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
                    controller: passwordController,
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
                          
                          loginRequest(emailController.text, passwordController.text);

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

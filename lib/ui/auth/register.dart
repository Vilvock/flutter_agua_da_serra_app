import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agua_da_serra_app/config/validator.dart';
import 'package:flutter_agua_da_serra_app/global/application_constant.dart';
import 'package:flutter_agua_da_serra_app/model/user.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/ui/utilities/pdf_viewer.dart';
import 'package:flutter_agua_da_serra_app/ui/main/home.dart';
import 'package:flutter_agua_da_serra_app/web_service/links.dart';
import 'package:flutter_agua_da_serra_app/web_service/service_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom_app_bar.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
  }

  late final validator;
  final postRequest = PostRequest();
  User? _registerResponse;

  Future<void> registerRequest(
      String email,
      String password,
      String fantasyName,
      String socialReason,
      String cnpj,
      String cellphone,
      String latitude,
      String longitude) async {
    try {
      final body = {
        {
          "razao_social": socialReason,
          "nome_fantasia": fantasyName,
          "cnpj": cnpj,
          "email": email,
          "celular": cellphone,
          "password": password,
          "latitude": latitude,
          "longitude": longitude,
          "token": ApplicationConstant.TOKEN
        }
      };

      print('HTTP_BODY: $body');

      final json = await postRequest.sendPostRequest(Links.REGISTER, body);
      // final parsedResponse = jsonDecode(json); // pegar um objeto so

      List<Map<String, dynamic>> _map = [];
      _map = List<Map<String, dynamic>>.from(jsonDecode(json));

      print('HTTP_RESPONSE: $_map');

      final response = User.fromJson(_map[0]);

      if (response.status == "01") {
        setState(() {
          _registerResponse = response;
          saveUserToPreferences(_registerResponse!);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              ModalRoute.withName("/ui/home"));
        });
      } else {}
    } catch (e) {
      setState(() {
        print('HTTP_ERROR: $e');
      });
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
    validator = Validator(context: context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(),
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
                      width: double.infinity,
                      child: Text(
                        "Olá, \nCrie uma conta",
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: 'Razão Social',
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
                        hintText: 'Nome Fantasia',
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
                        hintText: 'CNPJ',
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
                    GestureDetector(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: Dimens.marginApplication,
                                bottom: Dimens.marginApplication),
                            child: Text(
                              "Ao clicar no botão Criar conta, você aceita os termos de privacidade do aplicativo.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimens.textSize5,
                                fontFamily: 'Inter',
                              ),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, "/ui/pdf_viewer");
                        }),
                    Container(
                      margin: EdgeInsets.only(top: Dimens.marginApplication),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                OwnerColors.colorPrimary),
                          ),
                          onPressed: () {

                            if (!validator.validateEmail(emailController.text)) return;
                            if (!validator.validatePassword(passwordController.text)) return;

                            // registerRequest(emailController.text, passwordController.text, fantasyName, socialReason, cnpj, cellphone, latitude, longitude);

                          },
                          child: Text(
                            "Criar conta",
                            style: TextStyle(
                                fontSize: Dimens.textSize8,
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                          )),
                    ),
                    SizedBox(height: Dimens.marginApplication),
                    GestureDetector(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: Dimens.marginApplication,
                                bottom: Dimens.marginApplication),
                            child: Text(
                              "Já possui uma conta? Entre aqui",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimens.textSize5,
                                fontFamily: 'Inter',
                              ),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
            )),
          ]),
        )));
  }
}

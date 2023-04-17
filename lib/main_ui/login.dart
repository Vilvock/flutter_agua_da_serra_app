import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// VAI NA LINHA 107
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
}

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff15478E),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
    resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 51, bottom: 32, left: 16, right: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: Color(0xff15478E),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Image.asset("images/logo_white.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Color(0x7c15478e)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Color(0xff15478E),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: TextStyle(color: Color(0x7c15478e)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    obscureText: true,
                    style: TextStyle(
                      color: Color(0xff15478E),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/ui/home'); //AQUI ESTA UMA NAVEGAÇAO COM ROTA

                          },
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(
                                color: Color(0xff15478E),
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(16)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            )),
                          ))),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Color(0xff15478E),
              ),
            )
          ],
        ),
      ),
    );
  }
}

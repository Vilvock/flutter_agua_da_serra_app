import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
// VAI NA LINHA 15
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/ui/onboarding'); //AQUI ESTA UMA NAVEGAÇAO COM ROTA
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0x15478E),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Image.asset(
            'images/main_logo_1.png',
          ),
        ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [OwnerColors.gradientFirstColor, OwnerColors.gradientSecondaryColor, OwnerColors.gradientThirdColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            ),
          ),
      );
  }
}

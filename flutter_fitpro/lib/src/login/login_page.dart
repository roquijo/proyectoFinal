import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/my_colors.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          child: Stack(
            children: [
               Positioned(
               top: -80,
               left: -100,
               child: _OvalClipper()
              ),
              Positioned(
                child: _textLogin(),
                top: 60,
                left: 25,
              ),
              Column(
                children: [
                  //_imageBanner(),
                  _lottierAnimation(),
                  _textFielEmail(),
                  _textFielPassword(),
                  _textForgetYourPassword(),
                  _buttonLogin(),
                  _textDontHaveAccount(),
                ],
              ),
            ],
          ),
        ),
     );
  }

  Widget _lottierAnimation(){
    return Container(
      margin: EdgeInsets.only(
        top: 150,
        bottom: MediaQuery.of(context).size.height * 0.10,
      ),
      child: Lottie.asset(
          'assets/json/squat.json',
          width:350,
          height: 250,
          alignment: Alignment.center,
          fit: BoxFit.fill
      ),
    );
  }

  Widget _textLogin(){
    return Text(
      'FitPro',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _OvalClipper(){
    return Column(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(

              color: Colors.white70,
              height: MediaQuery.of(context).size.height*0.18,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               ),
            ),
          ),
      ],
    );
  }

  Widget _textForgetYourPassword(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿Olvidaste tu contraseña?'),
        SizedBox(width: 7),
        Text(
          'Recuperar contraseña',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor
          ),
        ),
      ],
    );
  }

  Widget _textDontHaveAccount(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿No tienes cuenta?'),
        SizedBox(width: 7),
        Text(
          'Registrate',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor
          ),
        ),
      ],
    );
  }

  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: (){},
        child: Text('Ingresar'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }

  Widget _textFielPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: MyColors.primaryOpcityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: MyColors.primaryDarkColor,
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textFielEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpcityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Usuario',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: MyColors.primaryDarkColor,
            ),
            prefixIcon: Icon(
              Icons.supervised_user_circle,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _imageBanner(){
    return Container(
      margin: EdgeInsets.only(
        top: 100,
        bottom: MediaQuery.of(context).size.height * 0.22,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/my_colors.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.red]
          ),
        ),
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height*0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ),

            Positioned(
              child: _textLogin(),
              top: 80,
              left: MediaQuery.of(context).size.width/3.5,
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
                Positioned(
                  child: _textDesign(),
                ),
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
        top: 200,
        //bottom: MediaQuery.of(context).size.height * 0.1,
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
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize:70,
          fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _textDesign(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Design by LAJOPA',
          style: TextStyle(
              color: Colors.white,
              fontSize: 15
          ),),
        SizedBox(width: 7,
          height: 40,),
      ],
    );
  }

  Widget _textForgetYourPassword(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿Olvidaste tu contraseña?'),
        SizedBox(width: 7,
          height: 40,),
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
        SizedBox(width: 7
        ),
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
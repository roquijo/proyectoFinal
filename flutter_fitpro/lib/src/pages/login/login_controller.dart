import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/utils/my_snackbar.dart';
import 'package:flutter_delivery/src/utils/shared_pref.dart';

import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../provider/users_provider.dart';

class LoginController {

  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  Shared_pref shared_pref = new Shared_pref();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);
  }

  void goToRegisterPages(){
    Navigator.pushNamed(context, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    ResponseApi responseApi = await usersProvider.login(email, password);

    if(responseApi.success){
      User user = User.fromJson(responseApi.data);
      shared_pref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
    }
    else {
      MySnackbar.show(context, responseApi.message);
    }

    print('RESPUESTA: ${responseApi.toJson()}');
    print('EMAIL: $email');
    print('PASSWORD: $password');
  }
}
import 'package:flutter/cupertino.dart';

import '../../../utils/shared_pref.dart';

class ClientProductListController {

  BuildContext context;
  Shared_pref shared_pref = new Shared_pref();


  Future init(BuildContext context) {
    this.context = context;
  }

  logout() {
    shared_pref.logout(context);
  }
}

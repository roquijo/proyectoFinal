import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/pages/client/list/client_products_list_controller.dart';

class clientProductsListPage extends StatefulWidget {
  const clientProductsListPage({Key key}) : super(key: key);

  @override
  _clientProductsListPageState createState() => _clientProductsListPageState();
}

class _clientProductsListPageState extends State<clientProductsListPage> {

  ClientProductListController controller = new ClientProductListController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(context);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: ElevatedButton(
          onPressed: controller.logout,
          child: Text('Cerrar Sesion'),
        ),
      )
    );
  }
}

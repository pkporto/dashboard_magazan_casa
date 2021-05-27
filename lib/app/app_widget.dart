import 'package:dashboard_magazan_casa/app/pages/products/add_products/add_products.dart';
import 'package:dashboard_magazan_casa/app/pages/products/edit_products/edit_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Painel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/add_products',
      getPages: [
        GetPage(name: '/:page_name', page: () => MasterPage()),
      ],
    );
  }
}

class MasterPage extends StatelessWidget {
  Widget view = AddProducts();

  MasterPage() {
    Map<String, Widget> InnterRoutes = {
      'edit_products': EditProducts(),
      'add_products': AddProducts()
    };
    view = InnterRoutes[Get.parameters['page_name']]!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 24.0, 3, 6),
              child: Column(
                children: [
                  ListTile(
                    hoverColor: Colors.black26,
                    tileColor: Colors.blue,
                    leading: Icon(Icons.menu),
                    title: Text('Adicionar Produto'),
                    onTap: () {
                      Get.toNamed('/add_products');
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.black26,
                    tileColor: Colors.blue,
                    leading: Icon(Icons.menu),
                    title: Text('Editar Produto'),
                    onTap: () {
                      Get.toNamed('/edit_products');
                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.white,
                child: view,
              ))
        ],
      ),
    ));
  }
}

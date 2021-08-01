import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:peliculas_app_fluter/models/product.model.dart';
import 'package:peliculas_app_fluter/screens/cart/cart_controller.dart';
import 'package:peliculas_app_fluter/screens/home/shopping-cart/shopping-cart.dart';
import 'package:peliculas_app_fluter/screens/home/single_item.dart';
import 'package:peliculas_app_fluter/screens/profile/screen.dart';
import 'package:peliculas_app_fluter/services/products_service.dart';

class ItemListScreen extends StatelessWidget {
  final productsProvider = new ProducsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                      color: Colors.white, child: ShoppingCartBottomSheet()),
                );
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Home'),
              onTap: () async {
                CartScreenController.to.sidebarOption.value = 0;
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Payments history'),
              onTap: () async {},
            ),
            ListTile(
              onTap: () {
                CartScreenController.to.sidebarOption.value = 1;
              },
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
            )
          ],
        ),
      ),
      body: Obx(() => CartScreenController.to.sidebarOption.value == 0
          ? getProducts()
          : CartScreenController.to.sidebarOption.value == 1
              ? Container(
                  child: Text('PROFILE'),
                )
              : Container()),
    );
  }

  Widget getProducts() {
    return FutureBuilder(
      future: productsProvider.getProducts(),
      builder: (context, snapshot) {
        print(snapshot.hasData);
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return ProductList(
          productos: snapshot.data,
        );
      },
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Producto> productos;
  const ProductList({Key key, this.productos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("XSSS $productos");
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: productos.map((Producto product) {
          return SingleProductWidget(
            product: product,
          );
        }).toList());
  }
}

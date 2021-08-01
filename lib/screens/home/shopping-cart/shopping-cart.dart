import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas_app_fluter/models/product.model.dart';
import 'package:peliculas_app_fluter/screens/cart/cart_controller.dart';

class ShoppingCartBottomSheet extends StatelessWidget {
  const ShoppingCartBottomSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Obx(() =>
            listaCarrito(CartScreenController.to.productAddToCart.toList())),
      ],
    );
  }

  Widget listaCarrito(List<Producto> list) {
    print("LISTAAA $list");
    list.forEach((element) {
      print("WWW ${element.nombre}");
    });
    list.removeAt(0);
    return Column(
      children: list.map((e) => itemCarrito(e)).toList(),
    );
  }

  Widget itemCarrito(Producto product) {
    print(product);
    if (product != null) {
      return ListTile(
          leading:
              Image.network('http://192.168.1.6:1337${product.avatar.url}'),
          title: Text(product.nombre),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_left,
                size: 50,
              ),
              Text('0'),
              Icon(
                Icons.arrow_right,
                size: 50,
              ),
            ],
          ));
    }
    return Container();
  }
}

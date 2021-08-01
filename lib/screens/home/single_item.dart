import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas_app_fluter/models/product.model.dart';
import 'package:peliculas_app_fluter/screens/cart/cart_controller.dart';

class SingleProductWidget extends StatelessWidget {
  final Producto product;

  const SingleProductWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  "http://192.168.1.6:1337/uploads/zapatilla_a77add4c51.jpg",
                  width: double.infinity,
                )),
          ),
          Text(product.nombre),
          Text('Adidas'),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("S/. ${product.precio.toString()}"),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    Get.snackbar(
                      'Agregado',
                      "Producto agregado al  carrito",
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.brown[100],
                    );
                    CartScreenController.to.productAddToCart.add(product);
                  })
            ],
          ),
        ],
      ),
    );
  }
}

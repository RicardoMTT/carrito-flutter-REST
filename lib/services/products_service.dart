import 'package:peliculas_app_fluter/models/product.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProducsService {
  final String url = "http://192.168.1.6:1337/productos";

  Future<List<Producto>> getProducts() async {
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    print("XD $jsonResponse");
    var products = Producto.fromJsonList(jsonResponse);

    return products.productsPostList;
  }
}

// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  Producto({
    this.id,
    this.nombre,
    this.precio,
    this.stock,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.avatar,
    this.productoId,
  });

  String id;
  String nombre;
  int precio;
  int stock;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Avatar avatar;
  String productoId;

  List<Producto> productsPostList = new List();

  Producto.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    }
    for (var item in jsonList) {
      final Producto post = new Producto.fromJson(
          item); // Se llama al fromJson para obtener un post de tipo Post, item es un Map
      productsPostList.add(post);
    }
  }

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["_id"],
        nombre: json["nombre"],
        precio: json["precio"],
        stock: json["stock"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        avatar: Avatar.fromJson(json["avatar"]),
        productoId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "precio": precio,
        "stock": stock,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "avatar": avatar.toJson(),
        "id": productoId,
      };
}

class Avatar {
  Avatar({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.width,
    this.height,
    this.url,
    this.formats,
    this.provider,
    this.related,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.avatarId,
  });

  String id;
  String name;
  String alternativeText;
  String caption;
  String hash;
  String ext;
  String mime;
  double size;
  int width;
  int height;
  String url;
  Formats formats;
  String provider;
  List<String> related;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String avatarId;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        id: json["_id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
        url: json["url"],
        formats: Formats.fromJson(json["formats"]),
        provider: json["provider"],
        related: List<String>.from(json["related"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        avatarId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "width": width,
        "height": height,
        "url": url,
        "formats": formats.toJson(),
        "provider": provider,
        "related": List<dynamic>.from(related.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": avatarId,
      };
}

class Formats {
  Formats({
    this.thumbnail,
    this.small,
  });

  Small thumbnail;
  Small small;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Small.fromJson(json["thumbnail"]),
        small: Small.fromJson(json["small"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "small": small.toJson(),
      };
}

class Small {
  Small({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.width,
    this.height,
    this.size,
    this.path,
    this.url,
  });

  String name;
  String hash;
  String ext;
  String mime;
  int width;
  int height;
  double size;
  dynamic path;
  String url;

  factory Small.fromJson(Map<String, dynamic> json) => Small(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        width: json["width"],
        height: json["height"],
        size: json["size"].toDouble(),
        path: json["path"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "width": width,
        "height": height,
        "size": size,
        "path": path,
        "url": url,
      };
}

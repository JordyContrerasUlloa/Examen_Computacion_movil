import 'dart:convert';

class Product {
  Product({
    required this.listado,
  });

  List<Listado> listado;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        listado:
            List<Listado>.from(json["Listado"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  Listado({
    required this.CodigoProducto,
    required this.NombreProducto,
    required this.PreciodelProducto,
    required this.Imagendelproducto,
    required this.EstadodelProducto,
  });

  int CodigoProducto;
  String NombreProducto;
  int PreciodelProducto;
  String Imagendelproducto;
  String EstadodelProducto;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        CodigoProducto: json["product_id"],
        NombreProducto: json["product_name"],
        PreciodelProducto: json["product_price"],
        Imagendelproducto: json["product_image"],
        EstadodelProducto: json["product_state"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": CodigoProducto,
        "product_name": NombreProducto,
        "product_price": PreciodelProducto,
        "product_image": Imagendelproducto,
        "product_state": EstadodelProducto,
      };

  Listado copy() => Listado(
      CodigoProducto: CodigoProducto,
      NombreProducto: NombreProducto,
      PreciodelProducto: PreciodelProducto,
      Imagendelproducto: Imagendelproducto,
      EstadodelProducto: EstadodelProducto);
}

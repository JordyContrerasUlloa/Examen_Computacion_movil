import 'dart:convert';

class Proveedor {
  Proveedor({
    required this.listado,
  });

  List<Listado> listado;

  factory Proveedor.fromJson(String str) => Proveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedor.fromMap(Map<String, dynamic> json) => Proveedor(
        listado: List<Listado>.from(
            json["Proveedores Listado"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado Provider": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  Listado({
    required this.CodigoProveedor,
    required this.NombreProveedor,
    required this.ApellidoProveedor,
    required this.MaildelProveedor,
    required this.EstadodelProveedor,
  });

  int CodigoProveedor;
  String NombreProveedor;
  String ApellidoProveedor;
  String MaildelProveedor;
  String EstadodelProveedor;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        CodigoProveedor: json["providerid"],
        NombreProveedor: json["provider_name"],
        ApellidoProveedor: json["provider_last_name"],
        MaildelProveedor: json["provider_mail"],
        EstadodelProveedor: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "provider_id": CodigoProveedor,
        "provider_name": NombreProveedor,
        "provider_last_name": ApellidoProveedor,
        "provider_mail": MaildelProveedor,
        "provider_state": EstadodelProveedor,
      };

  Listado copy() => Listado(
      CodigoProveedor: CodigoProveedor,
      NombreProveedor: NombreProveedor,
      ApellidoProveedor: ApellidoProveedor,
      MaildelProveedor: MaildelProveedor,
      EstadodelProveedor: EstadodelProveedor);
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negocio_jordy/models/proveedores.dart';

class ProveedorService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> proveedors = [];
  Listado? SelectProveedor;
  bool isLoading = true;
  bool isEditCreate = true;

  ProveedorService() {
    loadProveedors();
  }
  Future loadProveedors() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_list_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final proveedorsMap = Proveedor.fromJson(response.body);
    print(response.body);
    proveedors = proveedorsMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateProveedor(Listado proveedor) async {
    isEditCreate = true;
    notifyListeners();
    if (proveedor.CodigoProveedor == 0) {
      await this.createProveedor(proveedor);
    } else {
      await this.updateProveedor(proveedor);
    }

    isEditCreate = false;
    notifyListeners();
  }
  //Editar Proveedor

  Future<String> updateProveedor(Listado proveedor) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_edit_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    //actualizamos el listado
    final index = proveedors.indexWhere(
        (element) => element.CodigoProveedor == proveedor.CodigoProveedor);
    proveedors[index] = proveedor;

    return '';
  }

//Crear Proveedor
  Future createProveedor(Listado proveedor) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_add_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    this.proveedors.add(proveedor);
    return '';
  }

  //Eliminar Proveedor

  Future deleteProveedor(Listado proveedor, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_del_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    this.proveedors.clear(); //borra todo el listado
    loadProveedors();
    Navigator.of(context).pushNamed('list');
    return '';
  }
}

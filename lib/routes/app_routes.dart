import 'package:negocio_jordy/screen/screen_editar_categoria.dart';
import 'package:flutter/material.dart';
import 'package:negocio_jordy/screen/screen.dart';
import 'package:negocio_jordy/screen/proveedor_editar.dart';
import 'package:negocio_jordy/screen/main.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'list': (BuildContext context) => const ListProductScreen(),
    'edit': (BuildContext context) => const EditProductScreen(),
    'edit_categoria': (BuildContext context) => const EditCategoryScreen(),
    'edit_proveedor': (BuildContext context) => const EditProveedorScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
    'main': (BuildContext context) => const Main(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}

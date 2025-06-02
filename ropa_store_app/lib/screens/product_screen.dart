import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/producto.dart';
import '../services/config_service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Producto> productos = [];
  bool cargando = true;
  String? error;

  @override
  void initState() {
    super.initState();
    cargarProductos();
  }

  Future<void> cargarProductos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final url = Uri.parse('${ConfigService.baseUrl}/api/productos');

final response = await http.get(
  url,
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  },
);


      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          productos = data.map((e) => Producto.fromJson(e)).toList();
          cargando = false;
        });
      } else {
        setState(() {
          error = 'Error al obtener productos';
          cargando = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cargando) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    if (error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Productos')),
        body: Center(child: Text(error!, style: const TextStyle(color: Colors.red))),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final p = productos[index];
          return ListTile(
            title: Text(p.nombre),
            subtitle: Text('${p.marca} · \$${p.precio.toStringAsFixed(2)}'),
            trailing: Text('Stock: ${p.stock}'),
          );
        },
      ),
    );
  }
}

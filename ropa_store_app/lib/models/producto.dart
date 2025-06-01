class Producto {
  final String id;
  final String codigo;
  final String nombre;
  final double precio;
  final String marca;
  final int stock;

  Producto({
    required this.id,
    required this.codigo,
    required this.nombre,
    required this.precio,
    required this.marca,
    required this.stock,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      codigo: json['codigo'],
      nombre: json['nombre'],
      precio: (json['precio'] as num).toDouble(),
      marca: json['marca'],
      stock: json['stock'],
    );
  }
}

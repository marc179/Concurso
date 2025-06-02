# ropa_store_app – Flutter Frontend

Bienvenido a ropa_store_app, una aplicación Flutter conectada a un backend .NET + SQL Server. Permite a los usuarios registrarse, iniciar sesión con autenticación JWT y visualizar productos disponibles.
 
## 🚀 Características
 
✅ Registro e inicio de sesión con JWT  
✅ Visualización de productos desde el backend  
✅ Protección de rutas por roles (Cliente, Administrador, etc.)  
✅ Consumo de API RESTful desde Flutter  
✅ Interfaz adaptable para Web y Android
 
## 🛠️ Tecnologías usadas
 
- Flutter 3.x
- Dart
- API RESTful con ASP.NET Core (.NET 7)
- SQL Server
- Autenticación JWT
 
## ▶️ ¿Cómo ejecutar este proyecto?
 
1. Clona este repositorio:
 
```bash
git clone https://github.com/marc179/concurso.git
cd concurso

Instala las dependencias de Flutter:
flutter pub get

Configura la base URL en: lib/services/config_service.dart
import 'package:flutter/foundation.dart';
 
class ConfigService {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://127.0.0.1:5295'; // Flutter Web
    } else {
      return 'http://192.168.1.X:5295'; // Flutter Android – reemplazar con tu IP
    }
  }
}

Ejecuta la app:
flutter run -d chrome

Asegúrate de que el backend esté corriendo y accesible desde la red local.
🔗 Backend API
Repositorio backend (ASP.NET Core):
🔗 https://github.com/marc179/Concurso-Backend.git

Capturas en la carpeta screenshots

Gracias por visitar el repositorio

 
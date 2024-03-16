Bancom Test Demo

Bancom Test Demo es una aplicación de demostración que muestra cómo implementar un proceso de inicio de sesión, consumir una API y cargar imágenes desde una URL en iOS utilizando Alamofire y SDWebImage.

Funcionalidades

Inicio de sesión: Los usuarios pueden iniciar sesión utilizando sus credenciales. El session timeout es de 180 segs.
Consumo de API: La aplicación consume una API para obtener datos adicionales después del inicio de sesión.
Carga de imágenes: Se muestran imágenes desde una URL utilizando SDWebImage.
Requisitos

iOS 13.0+
Xcode 12.0+
Swift 5.0+
Instalación

Clona este repositorio en tu máquina local.
Abre el archivo bancom.xcworkspace en Xcode.
Compila y ejecuta la aplicación en un simulador o dispositivo iOS.
Uso

Inicio de sesión: En la pantalla de inicio, ingresa tus credenciales y presiona el botón "Iniciar sesión".
credenciales:
"correo@gmail.com"
"123456"

Consulta de datos: Después del inicio de sesión exitoso, la aplicación consume una API para obtener datos adicionales del usuario.
Visualización de imágenes: La aplicación muestra imágenes desde una URL proporcionada por la API utilizando SDWebImage.
Dependencias

Alamofire: Librería de red Swift.
SDWebImage: Librería para la carga asíncrona de imágenes.
Configuración

Para instalar las dependencias, asegúrate de tener CocoaPods instalado en tu sistema.
Ejecuta pod install en el directorio del proyecto.
Abre el archivo bancom.xcworkspace para abrir el proyecto con las dependencias instaladas.

Autor

Renzo Paul Chamorro Rojas

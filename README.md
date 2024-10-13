# Dotoro Assistant

Bienvenido a **Dotoro Assistant**, un proyecto multiplataforma desarrollado en **Flutter**. Este asistente virtual está diseñado para correr en dispositivos **iOS**, **Android** y **Web**. A continuación, te proporcionamos las instrucciones para ejecutar el proyecto de manera local y comenzar a desarrollar.

## Requisitos previos

Antes de comenzar, asegúrate de tener instalados los siguientes requisitos:

1. **Flutter SDK**: Descarga e instala el SDK de Flutter desde [flutter.dev](https://flutter.dev/docs/get-started/install).
2. **Dart SDK**: El SDK de Dart se incluye automáticamente con Flutter.
3. **Editor de código**: Se recomienda utilizar **Visual Studio Code** o **Android Studio** con las extensiones de Flutter/Dart para un mejor soporte de desarrollo.
4. **Emuladores/Simuladores**: Configura emuladores para Android o simuladores para iOS, dependiendo de la plataforma en la que quieras ejecutar el proyecto.

## Instalación

Sigue los pasos a continuación para configurar y ejecutar el proyecto en tu entorno local:


git clone https://github.com/tuusuario/dotoro-assistant.git
cd dotoro-assistant


Resuelve las dependencias del proyecto utilizando el comando:
bash
Copiar código
flutter pub get
Asegúrate de que la versión del SDK en el archivo pubspec.yaml coincida con la versión de Flutter que tienes instalada en tu sistema. Si es necesario, modifica la línea del SDK de Flutter dentro del archivo pubspec.yaml:
yaml
Copiar código
environment:
  sdk: ">=2.12.0 <3.0.0" # Ajusta según tu versión de Flutter/Dart
Ejecución del proyecto
Una vez que hayas configurado tu entorno, puedes ejecutar el proyecto con el siguiente comando:

bash
Copiar código
flutter run
Este comando compilará y ejecutará el proyecto en la plataforma que tengas disponible (Android, iOS, o Web). Asegúrate de tener un emulador o dispositivo conectado para la ejecución.

Soporte Multiplataforma
Dotoro Assistant está diseñado para ser compatible con las siguientes plataformas:

iOS
Android
Web
Para ejecutar en un entorno específico, puedes utilizar los siguientes comandos:

Android: flutter run -d android
iOS: flutter run -d ios
Web: flutter run -d chrome
Contribuir
Las contribuciones son bienvenidas. Si encuentras algún problema o tienes alguna mejora que sugerir, no dudes en abrir un issue o enviar un pull request. 

Arquitectura de la solucion:
![Arquitectura](https://github.com/user-attachments/assets/78f20fd0-2ba0-4ba0-adb5-0713602f6fb8)




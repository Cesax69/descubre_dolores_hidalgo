# Descubre Dolores Hidalgo

Descubre Dolores Hidalgo es una guía turística multimedia construida con Flutter siguiendo los principios de **Clean Architecture (Arquitectura Limpia)**. Esta app permite ver lugares emblemáticos, escuchar audios narrativos y reproducir videos.

## Arquitectura

El proyecto está dividido en tres capas principales que respetan la Regla de Dependencia de Clean Architecture:

1. **Capa de Dominio**: Contiene entidades puras (`LugarTuristico`), interfaces de repositorio y casos de uso (`ObtenerLugares`, `ObtenerLugarPorId`). Es el núcleo y no conoce a las demás capas ni al framework (Flutter).
2. **Capa de Datos**: Implementa las interfaces de repositorio y obtiene los datos. En este ejemplo usa un DataSource local.
3. **Capa de Presentación**: Gestiona el estado y la interfaz de usuario con ViewModels (MVVM) y Widgets de Flutter.

## Evidencias (Checklist de Arquitectura Limpia)

A continuación, se listan las evidencias de que el proyecto cumple con los lineamientos de Clean Architecture requeridos:

- [x] **Ningún archivo en `domain/` importa 'package:flutter/material.dart'**: El Dominio está completamente aislado de Flutter.
  *(Añade tu captura aquí)*
- [x] **Las entidades del Dominio no tienen métodos `fromJson`/`toJson`**: La entidad `LugarTuristico` es un objeto puro de Dart; el mapeo de datos es responsabilidad exclusiva de la capa de Datos.
  *(Añade tu captura aquí)*
- [x] **Cada caso de uso representa una sola acción del usuario**: Se implementaron `ObtenerLugares` y `ObtenerLugarPorId` como clases separadas con el método `call()`.
  *(Añade tu captura aquí)*
- [x] **Los ViewModels reciben casos de uso por su constructor, no crean sus propias dependencias internamente**: `LugaresViewModel` recibe su caso de uso inyectado, respetando la inversión de dependencias.
  *(Añade tu captura aquí)*
- [x] **`main.dart` es el único archivo que conoce las clases concretas de las 3 capas**: Actúa como el *Composition Root*, enlazando todas las instancias manualmente.
  *(Añade tu captura aquí)*
- [x] **Existe al menos una prueba del Dominio usando un Fake, sin tocar Flutter ni multimedia real**: El archivo `test/obtener_lugares_test.dart` prueba la lógica con un `FakeLugaresRepository`.
  *(Añade tu captura aquí)*
- [x] **Los controladores de audio/video se liberan con `dispose()`**: Tanto en el ViewModel (`DetalleViewModel`) como en los Widgets (`_DetalleLugarScreenState`), se invoca `dispose()` para limpiar recursos de memoria.
  *(Añade tu captura aquí)*

## Ejecución

1. Asegúrate de tener Flutter instalado (SDK ^3.13.2).
2. Ejecuta `flutter pub get` para obtener los paquetes (`audioplayers` y `video_player`).
3. Agrega tus imágenes, audios y videos reales a las carpetas `assets/images/`, `assets/audio/` y `assets/video/` según los nombres en el DataSource.
4. Ejecuta `flutter run` en un emulador o dispositivo físico.

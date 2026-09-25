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
      <img width="1618" height="1078" alt="image" src="https://github.com/user-attachments/assets/836f0ab2-45c0-477c-8993-9b05026f3312" />
      <img width="1628" height="1079" alt="image" src="https://github.com/user-attachments/assets/9bac24d1-525a-4781-ac4e-f770b16bf909" />


- [x] **Las entidades del Dominio no tienen métodos `fromJson`/`toJson`**: La entidad `LugarTuristico` es un objeto puro de Dart; el mapeo de datos es responsabilidad exclusiva de la capa de Datos.
      <img width="1618" height="1079" alt="image" src="https://github.com/user-attachments/assets/98c70494-45cd-4fe2-9d89-3a9c37550f3d" />

- [x] **Cada caso de uso representa una sola acción del usuario**: Se implementaron `ObtenerLugares` y `ObtenerLugarPorId` como clases separadas con el método `call()`.
      <img width="1626" height="1078" alt="image" src="https://github.com/user-attachments/assets/b687e6e1-7c78-498d-8ec6-13c835fc526e" />

- [x] **Los ViewModels reciben casos de uso por su constructor, no crean sus propias dependencias internamente**: `LugaresViewModel` recibe su caso de uso inyectado, respetando la inversión de dependencias.
      <img width="1608" height="1079" alt="image" src="https://github.com/user-attachments/assets/ad8147f1-1ff9-4018-9fe5-2644675c9926" />

- [x] **`main.dart` es el único archivo que conoce las clases concretas de las 3 capas**: Actúa como el *Composition Root*, enlazando todas las instancias manualmente.
      <img width="1618" height="1079" alt="image" src="https://github.com/user-attachments/assets/0804064d-618e-4794-be4d-4448d9bbeb65" />

- [x] **Existe al menos una prueba del Dominio usando un Fake, sin tocar Flutter ni multimedia real**: El archivo `test/obtener_lugares_test.dart` prueba la lógica con un `FakeLugaresRepository`.
      <img width="1623" height="1079" alt="image" src="https://github.com/user-attachments/assets/d8e05bfa-d725-43a0-a256-3088897359e5" />

- [x] **Los controladores de audio/video se liberan con `dispose()`**: Tanto en el ViewModel (`DetalleViewModel`) como en los Widgets (`_DetalleLugarScreenState`), se invoca `dispose()` para limpiar recursos de memoria.
      <img width="1624" height="1079" alt="image" src="https://github.com/user-attachments/assets/2e47889f-9876-4bf7-8940-12539b28d744" />



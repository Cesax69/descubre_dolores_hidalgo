import '../../domain/entities/lugar_turistico.dart';

class LugaresLocalDataSource {
  List<LugarTuristico> obtenerLugares() {
    return [
      const LugarTuristico(
        id: '1',
        nombre: 'Jardin Principal',
        descripcion: 'El corazon de Dolores Hidalgo, rodeado de portales y cafes.',
        imagenAsset: 'assets/images/do4.jpg',
        audioAsset: 'audio/jardin_principal.mp3',
        videoAsset: 'assets/video/videoplayback.mp4',
      ),
      const LugarTuristico(
        id: '2',
        nombre: 'Parroquia de Nuestra Senora de los Dolores',
        descripcion: 'El lugar donde Miguel Hidalgo dio el Grito de Independencia en 1810.',
        imagenAsset: 'assets/images/mexico-dolores-hidalgo-catedral.jpg',
        audioAsset: 'audio/parroquia.mp3',
      ),
      const LugarTuristico(
        id: '3',
        nombre: 'Museo Casa de Hidalgo',
        descripcion: 'La casa donde vivio el cura Miguel Hidalgo antes de la Independencia.',
        imagenAsset: 'assets/images/273180041_3102974319917005_64892460683014868_n.jpg',
        audioAsset: 'audio/museo_hidalgo.mp3',
      ),
    ];
  }
}

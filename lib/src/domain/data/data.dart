import 'package:music_note/src/domain/entities/composition.dart';

class TempData {
  static List<CompositionEntity> compositions = [
    CompositionEntity(
      title: "Fur Elise",
      artist: "Ludwig wan Beethoven",
      imageAsset: "assets/images/1.png",
      audioAsset: "assets/audio/1.mp3",
    ),
    CompositionEntity(
      title: "Nocturne No.20",
      artist: "Frederic Chopin",
      imageAsset: "assets/images/2.png",
      audioAsset: "assets/audio/2.mp3",
    ),
    CompositionEntity(
      title: "Valse",
      artist: "Eugeny Grinko",
      imageAsset: "assets/images/3.png",
      audioAsset: "assets/audio/3.mp3",
    ),
    CompositionEntity(
      title: "The Heart Asks Pleasure...",
      artist: "Michael Nyman",
      imageAsset: "assets/images/4.png",
      audioAsset: "assets/audio",
    ),
    CompositionEntity(
      title: "Gnosienne: No. 1",
      artist: "Erik Satie",
      imageAsset: "assets/images/5.png",
      audioAsset: "assets/audio",
    ),
  ];
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_note/src/domain/entities/composition.dart';

part 'player_cubit.freezed.dart';
part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerState());

  final player = AudioPlayer();

  void initCubit() {
    player.durationStream.listen((event) {
      emit(state.copyWith(duration: event?.inMilliseconds ?? 0));
    });

    player.positionStream.listen((event) {
      emit(state.copyWith(position: event.inMilliseconds));
    });
  }

  void playComposition(CompositionEntity composition) async {
    if (composition.title == state.composition?.title && player.playerState.playing) {
      await player.pause();
      return;
    }

    emit(state.copyWith(composition: composition));
    player.setAsset(composition.audioAsset);
    await player.play();
  }
}

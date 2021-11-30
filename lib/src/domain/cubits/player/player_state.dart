part of 'player_cubit.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    CompositionEntity? composition,
    @Default(0) int position,
    @Default(0) int duration,
  }) = _PlayerState;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/payment_model/card_model.dart';

part 'card_state.freezed.dart';

@freezed
abstract class CardState with _$CardState {
  const factory CardState({
    String? errorMessage,
    bool? loading,
    List<CardModel>? card,
    int? selectedCardId,
  }) = _CardState;

  factory CardState.initial() => const CardState(
    errorMessage: null,
    loading: true,
    card: [],
    selectedCardId: null,
  );
}

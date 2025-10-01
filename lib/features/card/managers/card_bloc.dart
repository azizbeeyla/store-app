import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/model/payment_model/add_cart_model.dart';
import 'package:store_app/data/repository/card_repository.dart';
import 'card_event.dart';
import 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository _repo;

  CardBloc({required CardRepository repo})
      : _repo = repo,
        super(CardState.initial()) {
    on<CardListEvent>(_onLoadCards);
    on<CardAddEvent>(_onAddCard);
    on<SelectCardEvent>(_onSelectCard);

    add(CardListEvent());
  }

  Future<void> _onLoadCards(
      CardListEvent event,
      Emitter<CardState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _repo.getCards();

    result.fold(
          (error) {
        emit(state.copyWith(errorMessage: error.toString(), loading: false));
      },
          (cards) {
        emit(
          state.copyWith(
            card: cards,
            loading: false,
            selectedCardId: cards.isNotEmpty ? cards.first.id : null,
          ),
        );
      },
    );
  }

  Future<void> _onAddCard(
      CardAddEvent event,
      Emitter<CardState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _repo.addCard(event.data);

    result.fold(
          (error) {
        emit(state.copyWith(errorMessage: error.toString(), loading: false));
      },
          (_) {
        add(CardListEvent());
      },
    );
  }

  void _onSelectCard(
      SelectCardEvent event,
      Emitter<CardState> emit,
      ) {
    emit(state.copyWith(selectedCardId: event.selectedId));
  }
}

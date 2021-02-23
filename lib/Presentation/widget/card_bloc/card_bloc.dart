import 'dart:async';

import 'package:Carousel/data/models/results.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial());

  @override
  Stream<CardState> mapEventToState(
    CardEvent event,
  ) async* {
    if (event is CardSwapEvent) {
      yield* _rightSwipe(event);
    }
  }

  Stream _rightSwipe(CardSwapEvent event) async* {
    yield CardSwappingState();
    final data = event.swapE;
    yield CardSwapState(swapS: data);
  }
}

import 'dart:async';

import 'package:_carousel/data/models/results.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/carousel.dart';
import '../../../../domain/usecase/user_use_case.dart';

part 'favourite_screen_event.dart';
part 'favourite_screen_state.dart';

class FavouriteScreenBloc
    extends Bloc<FavouriteScreenEvent, FavouriteScreenState> {
  UserUseCase userUseCase;
  FavouriteScreenBloc() : super(FavouriteScreenInitial()) {
    this.userUseCase = UserUseCase();
  }

  @override
  Stream<FavouriteScreenState> mapEventToState(
    FavouriteScreenEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LoadUserEvent:
        yield* _mapLoadUserDataEventToState(event);
        break;
      case RemoveUserEvent:
        yield* _mapRemoveUserItemEventToState(event);
        break;
    }
  }

  Stream<FavouriteScreenState> _mapLoadUserDataEventToState(
      LoadUserEvent event) async* {
    yield LoadingState(state.carouselF);
    final Carousel carouselFa = await userUseCase.getUserData(fromLocal: true);
    yield LoadedState(carouselFa);
  }

  Stream<FavouriteScreenState> _mapRemoveUserItemEventToState(
      RemoveUserEvent event) async* {
    int index = event.index;
    bool fromLocal = event.fromLocal;
    Carousel carousel = state.carouselF;
    List<Results> results = carousel.results;
    if (results.isNotEmpty) {
      if (fromLocal) {
        yield LoadedState(state.carouselF);
        Results result = results[index];
        await userUseCase.removeUser(result.id);
      }
      results.removeAt(index);
    }
    yield ItemRemovedState(Carousel(results: results));
  }
}

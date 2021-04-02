import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../../../../data/models/carousel.dart';
import '../../../../data/models/results.dart';
import '../../../../domain/usecase/user_use_case.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  UserUseCase userCase;

  ListBloc() : super(ListInitial()) {
    this.userCase = UserUseCase();
  }
  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    switch (event.runtimeType) {
      case ListFetchEvent:
        yield* _mapLoadUserDataEventToState(event);
        break;
      case RemoveUserItemEvent:
        yield* _mapRemoveUserItemEventToState(event);
        break;
      case SaveUserEvent:
        yield* _mapSaveUserEventToState(event);
        break;
    }
  }

  Stream<ListState> _mapLoadUserDataEventToState(ListFetchEvent event) async* {
    yield ListLoadingState(state.carousel);
    final carousel = await userCase.getUserData();
    yield ListSuccess(carousel: carousel);
  }

  Stream<ListState> _mapRemoveUserItemEventToState(
      RemoveUserItemEvent event) async* {
    List<Results> currentList = state.carousel.results;
    if (currentList.isNotEmpty) {
      currentList.removeAt(event.index);
    }
    Carousel carousel = Carousel(results: currentList);
    yield ItemRemovedState(carousel);
  }

  Stream<ListState> _mapSaveUserEventToState(SaveUserEvent event) async* {
    Carousel carousel = state.carousel;
    if (carousel.results.isNotEmpty) {
      yield ListLoadingState(carousel);
      Results data = carousel.results[event.index];
      await userCase.saveUser(data);
      carousel.results.removeAt(event.index);
    }
    yield UserSavedState(carousel);
  }
}

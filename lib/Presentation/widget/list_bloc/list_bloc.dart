import 'dart:async';

// import 'package:Carousel/Data/models/carousel.dart';
// import 'package:Carousel/data/models/carousel.dart';
import '../../../domain/usecase/user_use_case.dart';

// import '../../../data/repository/repository.dart';
import 'package:bloc/bloc.dart';

part 'list_event.dart';
part 'list_state.dart';
/*
class ListBloc extends Bloc<ListEvent, ListState> {
  UserUseCase userUseCase;
  ListBloc() : super(ListInitial());

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    if (event is ListFetchEvent) {
      Carousel data = await carouselRepository.getUserData();
      yield ListSuccess(name: data as List);
    } else {
      yield ListFailure();
    }
  }
}
*/

class ListBloc extends Bloc<ListEvent, ListState> {
  UserUseCase userCase;

  ListBloc() : super(ListInitial()) {
    this.userCase = UserUseCase();
  }

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    switch (event.runtimeType) {
      case ListFetchEvent:
        {
          yield* _mapLoadUserDataEventToState(event);
        }
    }
  }

  Stream<ListState> _mapLoadUserDataEventToState(ListFetchEvent event) async* {
    yield ListLoadingState();
    final userData = await userCase.getUserData();
    yield ListSuccess(carousel: userData);
  }
}

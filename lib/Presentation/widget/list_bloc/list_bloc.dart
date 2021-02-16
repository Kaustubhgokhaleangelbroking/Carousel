import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../domain/usecase/user_use_case.dart';

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

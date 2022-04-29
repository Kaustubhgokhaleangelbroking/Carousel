import 'dart:async';

import 'package:_carousel/data/models/results.dart';
import 'package:_carousel/domain/usecase/user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitial());
  UserUseCase useCase = UserUseCase();

  @override
  Stream<ButtonState> mapEventToState(
    ButtonEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LoadingEvent:
        yield* _mapLoadingEventToState(event);
        break;
      case ButtonTapEvent:
        yield* _mapButtonTapEventToState(event);
        break;
    }
  }

  Stream<dynamic> _mapLoadingEventToState(LoadingEvent event) async* {
    yield container();
  }

  Stream<dynamic> _mapButtonTapEventToState(ButtonTapEvent event) async* {
    var text = Text('Hi');
    yield ButtonDataState(text);
  }

  Widget container() {
    return Center(
      child: Container(
        height: 10.0,
        width: 10.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

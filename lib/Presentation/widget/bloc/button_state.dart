part of 'button_bloc.dart';

@immutable
abstract class ButtonState {}

class ButtonInitial extends ButtonState {}

class ButtonDataLoadingState extends ButtonState {}

class ButtonDataState extends ButtonState {
  final Text text;

  ButtonDataState(this.text);
}

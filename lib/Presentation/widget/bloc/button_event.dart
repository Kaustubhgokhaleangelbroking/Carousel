part of 'button_bloc.dart';

@immutable
abstract class ButtonEvent {}

class LoadingEvent extends ButtonEvent {}

class ButtonTapEvent extends ButtonEvent {
  final icons;
  final Results user;

  ButtonTapEvent({this.icons, this.user});
}

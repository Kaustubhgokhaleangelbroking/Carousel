part of 'card_bloc.dart';

@immutable
abstract class CardEvent {}

class CardSwapEvent extends CardEvent {
  final Results swapE;

  CardSwapEvent({@required this.swapE});
}

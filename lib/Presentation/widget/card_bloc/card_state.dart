part of 'card_bloc.dart';

@immutable
abstract class CardState {}

class CardInitial extends CardState {}

class CardSwappingState extends CardState {}

class CardSwapState extends CardState {
  final Results swapS;

  CardSwapState({this.swapS});
}

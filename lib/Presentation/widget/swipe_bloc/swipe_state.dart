part of 'swipe_bloc.dart';

abstract class SwipeState {
  const SwipeState();

  List<Object> get props => [];
}

class SwipeInitial extends SwipeState {}

class SwipeLeftState extends SwipeState {
  List<Object> get props => [];
}

class SwipeRightState extends SwipeState {
  List<Object> get props => [];
}

part of 'swipe_bloc.dart';

abstract class SwipeEvent {
  const SwipeEvent();

  List<Object> get props => [];
}

class SwipeLeftEvent extends SwipeEvent {
  List<Object> get props => [];
}

class SwipeRightEvent extends SwipeEvent {
  List<Object> get props => [];
}

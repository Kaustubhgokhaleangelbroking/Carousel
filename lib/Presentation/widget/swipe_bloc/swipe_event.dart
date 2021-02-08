part of 'swipe_bloc.dart';

abstract class SwipeEvent {
  const SwipeEvent();

  @override
  List<Object> get props => [];
}

class SwipeLeftEvent extends SwipeEvent {
  @override
  List<Object> get props => [];
}

class SwipeRightEvent extends SwipeEvent {
  @override
  List<Object> get props => [];
}

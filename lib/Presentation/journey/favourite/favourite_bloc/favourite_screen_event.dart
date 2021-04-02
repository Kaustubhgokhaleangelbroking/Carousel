part of 'favourite_screen_bloc.dart';

abstract class FavouriteScreenEvent {}

class LoadUserEvent extends FavouriteScreenEvent {}

class RemoveUserEvent extends FavouriteScreenEvent {
  int index;
  bool fromLocal;

  RemoveUserEvent({this.index, this.fromLocal = true});
}

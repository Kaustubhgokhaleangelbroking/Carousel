part of 'list_bloc.dart';

abstract class ListState {
  final Carousel carousel;
  ListState(this.carousel);
}

class ListInitial extends ListState {
  ListInitial() : super(Carousel(results: []));
}

class ListLoadingState extends ListState {
  ListLoadingState(Carousel carousel) : super(carousel);
}

class ListSuccess extends ListState {
  final Carousel carousel;

  ListSuccess({this.carousel}) : super(carousel);
}

class ItemRemovedState extends ListState {
  ItemRemovedState(Carousel carousel) : super(carousel);
}

class UserSavedState extends ListState {
  UserSavedState(Carousel carousel) : super(carousel);
}

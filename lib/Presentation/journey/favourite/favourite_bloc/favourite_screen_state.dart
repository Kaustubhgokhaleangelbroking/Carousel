part of 'favourite_screen_bloc.dart';

@immutable
abstract class FavouriteScreenState {
  final Carousel carouselF;

  FavouriteScreenState(this.carouselF);
}

class FavouriteScreenInitial extends FavouriteScreenState {
  FavouriteScreenInitial() : super(Carousel(results: []));
}

class LoadingState extends FavouriteScreenState {
  LoadingState(Carousel carouselF) : super(carouselF);
}

class LoadedState extends FavouriteScreenState {
  LoadedState(Carousel carouselF) : super(carouselF);
}

class ItemRemovedState extends FavouriteScreenState {
  ItemRemovedState(Carousel carouselF) : super(carouselF);
}

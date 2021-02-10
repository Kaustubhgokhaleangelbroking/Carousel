part of 'list_bloc.dart';

abstract class ListState {
  const ListState();
}

class ListInitial extends ListState {}

class ListLoadingState extends ListState {}

class ListFailure extends ListState {}

class ListSuccess extends ListState {
  final carousel;

  ListSuccess({this.carousel});
}

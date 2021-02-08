part of 'list_bloc.dart';

abstract class ListState {
  const ListState();
}

class ListInitial extends ListState {}

class ListFailure extends ListState {}

class ListSuccess extends ListState {
  final List name;

  ListSuccess({this.name});
}

part of 'list_bloc.dart';

abstract class ListEvent {
  ListEvent();
}

class InitialEvent extends ListEvent {}

class ListFetchEvent extends ListEvent {}

class RemoveUserItemEvent extends ListEvent {
  final int index;

  RemoveUserItemEvent({
    @required this.index,
  });
}

class SaveUserEvent extends ListEvent {
  int index;

  SaveUserEvent({
    @required this.index,
  });
}

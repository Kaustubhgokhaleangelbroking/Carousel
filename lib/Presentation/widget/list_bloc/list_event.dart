part of 'list_bloc.dart';

abstract class ListEvent {
  const ListEvent();

  List<Object> get props => [];
}

class InitialEvent extends ListEvent {}

class ListFetchEvent extends ListEvent {}

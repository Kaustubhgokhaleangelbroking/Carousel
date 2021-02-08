part of 'list_bloc.dart';

abstract class ListEvent {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class ListFetchEvent extends ListEvent {}

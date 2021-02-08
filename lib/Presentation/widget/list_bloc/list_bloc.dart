// import 'dart:async';

// import 'package:Carousel/Data/repository/repository.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'list_event.dart';
// part 'list_state.dart';

// class ListBloc extends Bloc<ListEvent, ListState> {
//   CarouselRepository carouselRepository;
//   ListBloc() : super(ListInitial());

//   @override
//   Stream<ListState> mapEventToState(
//     ListEvent event,
//   ) async* {
//     final currentState = state;
//     if (event is ListFetchEvent) {
//       if (currentState is ListSuccess) {
//         final list = await carouselRepository
//             .getUserData((currentState.name.length++).toString());
//         yield ListSuccess(name: list);
//       }
//     }
//   }
// }

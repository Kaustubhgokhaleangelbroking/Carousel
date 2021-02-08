import 'package:Carousel/Data/repository/repository.dart';
import 'package:Carousel/Presentation/widget/list_bloc/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardSwap extends StatefulWidget {
  CardSwap({Key key}) : super(key: key);

  @override
  _CardSwapState createState() => _CardSwapState();
}

class _CardSwapState extends State<CardSwap> {
  CarouselRepository carouselRepository;
  final scrollController = ScrollController();
  final scrollThreshold = 200;
  ListBloc listBloc;

  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
    listBloc = BlocProvider.of<ListBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
      ),
      body: BlocBuilder(
        cubit: listBloc,
        builder: (context, state) {
          return ListView.builder(
              controller: scrollController,
              itemCount: state.length,
              itemBuilder: (context, index) {
                return Card(child: null);
              }
              // return listBloc.add(ListFetchEvent());
              //ListBloc().add(ListFetchEvent());
              // : listBloc.add(ListFetchEvent());

              //ListBloc(/*name: state.name[index]*/);

              );
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listBloc.add(ListFetchEvent());
    }
  }
}

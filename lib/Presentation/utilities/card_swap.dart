import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../data/repository/repository.dart';
import '../widget/list_bloc/list_bloc.dart';
// import '../../data/models/carousel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ListBloc listBloc;

  @override
  void initState() {
    super.initState();
    listBloc = ListBloc();
  }

  @override
  void dispose() {
    listBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BlocBuilder(
                cubit: listBloc,
                builder: (context, state) {
                  if (state is ListLoadingState) {
                    return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  } else if (state is ListSuccess) {
                    return Text(
                      state.carousel.results.first.name.first,
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return Text(
                      "Home Page",
                      textAlign: TextAlign.center,
                    );
                  }
                },
              ),
            ),
            FlatButton(
                onPressed: () {
                  listBloc.add(ListFetchEvent());
                },
                child: Text(
                  "Tap to Load",
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(fontWeight: FontWeight.w600),
        ),
      );
}

/*
class CardSwap extends StatefulWidget {
  CardSwap({Key key}) : super(key: key);

  @override
  _CardSwapState createState() => _CardSwapState();
}

class _CardSwapState extends State<CardSwap> {
  // final CarouselRepository carouselRepository = CarouselRepository();
  // Future<Carousel> futureCarousel;
  // final scrollController = ScrollController();
  // final scrollThreshold = 200;
  ListBloc listBloc;

  void initState() {
    super.initState();
    // scrollController.addListener(onScroll);
    listBloc = BlocProvider.of<ListBloc>(context);
    buildItem();
    // futureCarousel = ;
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
          return FutureBuilder<Carousel>(
            future: buildItem(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.results.length.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          );
          /*return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                return FutureBuilder<Carousel>(
                  future: buildItem(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          snapshot.data.results[0].user.name.toString());
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                );
              }
              // return listBloc.add(ListFetchEvent());
              //ListBloc().add(ListFetchEvent());
              // : listBloc.add(ListFetchEvent());

              //ListBloc(/*name: state.name[index]*/);

              );*/
          /* return FutureBuilder<Carousel>(
            future: buildItem(),
            builder: (BuildContext context, snapshot) {
              return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Text(
                        snapshot.data.results[0].user.name.toString(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            },
          );*/
        },
      ),
    );
  }

  Future buildItem() async {
    return InkWell(
      onTap: () {
        listBloc.add(ListFetchEvent());
      },
    );
  }

  @override
  void dispose() {
    listBloc.close();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  // void onScroll() {
  //   final maxScroll = scrollController.position.maxScrollExtent;
  //   final currentScroll = scrollController.position.pixels;
  //   if (maxScroll - currentScroll <= scrollThreshold) {
  //     listBloc.add(ListFetchEvent());
  //   }
  // }

}
*/

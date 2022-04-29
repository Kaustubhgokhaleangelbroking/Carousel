import 'package:flutter/material.dart';

class CardArrangement extends StatelessWidget {
  final imageuUrl;

  const CardArrangement({Key key, this.imageuUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          maxRadius: 115,
          backgroundColor: Colors.black87,
        ),
        CircleAvatar(
          maxRadius: 114,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(115.0)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(115.0)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageuUrl),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}

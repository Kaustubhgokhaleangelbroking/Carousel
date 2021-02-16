import 'package:flutter/material.dart';

class CardArrangement extends StatelessWidget {
  const CardArrangement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=401&q=80';

    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          maxRadius: 100,
          backgroundColor: Colors.black54,
        ),
        CircleAvatar(
          maxRadius: 98,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageUrl),
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

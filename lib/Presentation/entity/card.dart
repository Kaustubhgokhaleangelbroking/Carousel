import 'package:Carousel/presentation/entity/card_arrangement.dart';
import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({
    Key key,
    this.text = "Card Example",
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Card(
          elevation: 20,
          color: Colors.white,
          // alignment: Alignment.center,
          // margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          // height: double.infinity,
          // width: double.infinity,
          // padding: EdgeInsets.all(38.0),
          // decoration: _boxDecoration(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CardArrangement(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'My Address is',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'abc 123 mand',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Icon(
                      Icons.phone,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // BoxDecoration _boxDecoration() {
  //   return BoxDecoration(
  //     borderRadius: BorderRadius.circular(15.0),
  //     border: Border.all(
  //       width: 2.0,
  //       color: Colors.transparent.withOpacity(0.3),
  //     ),
  //   );
  // }
}

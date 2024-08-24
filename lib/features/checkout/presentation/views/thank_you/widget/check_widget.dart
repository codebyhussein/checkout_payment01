import 'package:flutter/material.dart';

class CheckedWidget extends StatelessWidget {
  const CheckedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 0,
      right: 0,
      top: -50,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xffEDEDED),
        child: CircleAvatar(
          radius: 45,
          backgroundColor: Color(0xff34A853),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 42,
          ),
        ),
      ),
    );
  }
}

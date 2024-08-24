import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalCardPrice extends StatelessWidget {
  const TotalCardPrice(
      {super.key, required this.tilte, required this.cardPrice});
  final String tilte;
  final String cardPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tilte,
          style: Styles.style24,
        ),
        Text(
          cardPrice,
          style: Styles.style24,
        )
      ],
    );
  }
}

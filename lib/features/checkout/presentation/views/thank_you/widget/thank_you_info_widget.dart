import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ThankYouInfoWidget extends StatelessWidget {
  const ThankYouInfoWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.style18,
          ),
          Text(
            value,
            style: Styles.styleBold18,
          ),
        ],
      ),
    );
  }
}

import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, this.onTap, required this.text, this.isLoading = false});
  void Function()? onTap;
  String text;
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff34A853),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  style: Styles.style22,
                ),
        ),
      ),
    );
  }
}

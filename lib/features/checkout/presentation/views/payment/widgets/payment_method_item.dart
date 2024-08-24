import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  PaymentMethodItem(
      {super.key, required this.isActive, required this.image, this.onTap});
  bool isActive;
  final String image;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 62,
        width: 103,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: isActive
                    ? Colors.grey.withOpacity(0.5)
                    : Colors.white, // Shadow color
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // Offset
              ),
            ],
            border: Border.all(
                color: isActive ? const Color(0xff34A853) : Colors.grey)),
        child: Center(
            child: SvgPicture.asset(
          image,
          height: 24,
          fit: BoxFit.scaleDown,
        )),
      ),
    );
  }
}

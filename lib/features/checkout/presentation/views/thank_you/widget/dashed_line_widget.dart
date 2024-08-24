import 'package:flutter/material.dart';

class DashedlineWidget extends StatelessWidget {
  const DashedlineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          20,
          (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffB8B8B8),
                    ),
                  ),
                ),
              )),
    );
  }
}

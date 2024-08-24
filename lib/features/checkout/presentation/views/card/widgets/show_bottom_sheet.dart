import 'package:checkout_payment/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../payment/widgets/payment_method_listview.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffEDEDED),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const PaymentMethodListview(),
          Padding(
            padding: const EdgeInsets.all(50),
            child: CustomButton(text: 'Continue'),
          )
        ],
      ),
    );
  }
}

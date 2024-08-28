import 'package:checkout_payment/features/checkout/presentation/views/card/widgets/custom_consumer_button.dart';
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          PaymentMethodListview(),
          CustomConsumerButton()
        ],
      ),
    );
  }
}

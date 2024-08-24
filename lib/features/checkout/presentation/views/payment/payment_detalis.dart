import 'package:checkout_payment/features/checkout/presentation/views/payment/payment_daetails_view_body.dart';
import 'package:checkout_payment/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Payment Details',
          onPressed: () {
            Navigator.pop(context);
          }),
      body: const PaymentDetailsViewBody(),
    );
  }
}

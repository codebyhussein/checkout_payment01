import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:checkout_payment/features/checkout/presentation/views/card/my_card_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyCardApp());
}

class MyCardApp extends StatelessWidget {
  const MyCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCardView(),
    );
  }
}
// Payment Intent"odel create payment intent(amount
// currency , customerld)
// keySecret createEphemerolKey(stripeVers ton, customerld)
// tPaymentSheet (merchantDispLayNome
// intentCLientSecret
// , ephemeraLKeySec
// presentPaymentSheet()

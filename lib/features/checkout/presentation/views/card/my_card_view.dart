import 'package:checkout_payment/features/checkout/presentation/views/card/my_card_view_body.dart';
import 'package:checkout_payment/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My card '),
      body: const MyCardViewBody(),
    );
  }
}

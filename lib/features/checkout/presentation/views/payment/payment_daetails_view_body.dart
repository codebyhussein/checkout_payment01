import 'dart:developer';

import 'package:checkout_payment/features/checkout/presentation/views/card/widgets/custom_credit_card.dart';

import 'package:checkout_payment/features/checkout/presentation/views/payment/widgets/payment_method_listview.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you/thank_you_view.dart';
import 'package:checkout_payment/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Center(child: PaymentMethodListview()),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formKey: _formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    log('merna');
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const ThankyouView();
                      },
                    ));
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Pay',
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:checkout_payment/core/utils/widgets/custom_button.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/presentation/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomConsumerButton extends StatelessWidget {
  const CustomConsumerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const ThankyouView();
            },
          ));
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(50),
          child: CustomButton(
              onTap: () {
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                        amount: '100',
                        currency: 'USD',
                        customerId: ApiKeys.customerId);
                BlocProvider.of<PaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel);
              },
              isLoading: state is PaymentLoading ? true : false,
              text: 'Continue'),
        );
      },
    );
  }
}

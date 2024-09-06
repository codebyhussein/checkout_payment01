import 'dart:developer';

import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:checkout_payment/core/utils/widgets/custom_button.dart';
import 'package:checkout_payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_payment/features/checkout/data/models/amount_model/details.dart';
import 'package:checkout_payment/features/checkout/data/models/order_list_model/item.dart';
import 'package:checkout_payment/features/checkout/data/models/order_list_model/order_list_model.dart';
import 'package:checkout_payment/features/checkout/presentation/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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
                var transactionData = getTransactionData();
                excutePaybalPayment(context, transactionData);
              },
              isLoading: state is PaymentLoading ? true : false,
              text: 'Continue',

              // PaymentIntentInputModel paymentIntentInputModel =
              //     PaymentIntentInputModel(
              //         amount: '100',
              //         currency: 'USD',
              //         customerId: ApiKeys.customerId);
              // BlocProvider.of<PaymentCubit>(context).makePayment(
              //     paymentIntentInputModel: paymentIntentInputModel);),
            ));
      },
    );
  }

  void excutePaybalPayment(BuildContext context,
      ({AmountModel amout, OrderListModel orderlistModel}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paybalCustomerId,
        secretKey: ApiKeys.paybalSecretKey,
        transactions: [
          {
            "amount": transactionData.amout.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.orderlistModel.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amout, OrderListModel orderlistModel}) getTransactionData() {
    var amountModel = AmountModel(
        currency: 'USD',
        total: "100",
        details: Details(subtotal: "100", shipping: "0", shippingDiscount: 0));

    List<Order> orders = [
      Order(
        name: "Apple",
        currency: "USD",
        quantity: 4,
        price: "10",
      ),
      Order(name: "Pineapple", quantity: 5, price: '12', currency: "USD")
    ];
    var orderlistModel = OrderListModel(items: orders);

    return (amout: amountModel, orderlistModel: orderlistModel);
  }
}

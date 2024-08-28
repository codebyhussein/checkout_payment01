import 'package:checkout_payment/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:checkout_payment/features/checkout/presentation/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/views/card/widgets/show_bottom_sheet.dart';
import 'package:checkout_payment/features/checkout/presentation/views/card/widgets/card_info.dart';
import 'package:checkout_payment/features/checkout/presentation/views/card/widgets/total_card_price.dart';
import 'package:checkout_payment/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Expanded(child: Center(child: Image.asset('assets/images/card.png'))),
          const SizedBox(
            height: 20,
          ),
          CardInfo(
            text: 'Order Subtotal',
            value: '\$42.0',
          ),
          const SizedBox(
            height: 5,
          ),
          CardInfo(
            text: 'Discount',
            value: '\$0',
          ),
          const SizedBox(
            height: 5,
          ),
          CardInfo(
            text: 'Shipping',
            value: '\$8',
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffC7C7C7),
            height: 34,
          ),
          const TotalCardPrice(tilte: 'Total', cardPrice: '\$50.0'),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              // Navigate to the next screen
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) {
              //     return const PaymentDetails();
              //   },
              // ));

              showBottomSheet(
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                    child: const ShowBottomSheet(),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

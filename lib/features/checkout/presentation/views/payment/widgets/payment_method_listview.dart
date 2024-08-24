import 'package:checkout_payment/features/checkout/presentation/views/payment/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodListview extends StatefulWidget {
  const PaymentMethodListview({super.key});

  @override
  State<PaymentMethodListview> createState() => _PaymentMethodListviewState();
}

class _PaymentMethodListviewState extends State<PaymentMethodListview> {
  final List<String> paymentMethedsItem = const [
    'assets/images/cardview.svg',
    'assets/images/paypal.svg',
    'assets/images/appel.svg'
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethedsItem.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                image: paymentMethedsItem[index],
                isActive: currentIndex == index,
              ),
            );
          },
        ),
      ),
    );
  }
}

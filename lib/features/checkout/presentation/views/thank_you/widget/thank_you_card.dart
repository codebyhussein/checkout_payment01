import 'package:checkout_payment/core/utils/styles.dart';
import 'package:checkout_payment/features/checkout/presentation/views/card/widgets/total_card_price.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you/widget/card_info_widget.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you/widget/thank_you_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankyouCard extends StatelessWidget {
  const ThankyouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffEDEDED),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              style: Styles.style25,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your transaction was successful',
              style: Styles.style20,
            ),
            const SizedBox(
              height: 50,
            ),
            const ThankYouInfoWidget(
              title: 'Date',
              value: '01/24/2023',
            ),
            const SizedBox(
              height: 10,
            ),
            const ThankYouInfoWidget(
              title: 'Time',
              value: '10:15 AM',
            ),
            const SizedBox(
              height: 10,
            ),
            const ThankYouInfoWidget(
              title: 'To',
              value: 'Sam Louis',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Divider(
                    height: 60,
                    thickness: 2,
                  ),
                  TotalCardPrice(tilte: 'Total', cardPrice: '\$50.0'),
                  SizedBox(
                    height: 10,
                  ),
                  CradInfoWidget(),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.barcode,
                    size: 60,
                  ),
                  Container(
                    height: 70,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff34A853)),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        'PAID',
                        style: Styles.styleBold18
                            .copyWith(color: const Color(0XFF34A853)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

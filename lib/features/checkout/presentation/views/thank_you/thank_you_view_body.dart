import 'package:checkout_payment/core/utils/widgets/custom_appbar.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you/widget/check_widget.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you/widget/dashed_line_widget.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you/widget/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankyouViewBody extends StatelessWidget {
  const ThankyouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Transform.translate(
        offset: const Offset(0, -50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const ThankyouCard(),
              Positioned(
                left: 25,
                right: 25,
                bottom: MediaQuery.sizeOf(context).height * .2 + 20,
                child: const DashedlineWidget(),
              ),
              Positioned(
                left: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                right: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              const CheckedWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

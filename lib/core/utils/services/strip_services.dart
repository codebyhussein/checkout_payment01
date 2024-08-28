import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:checkout_payment/core/utils/services/api_services.dart';
import 'package:checkout_payment/features/checkout/data/models/init_payment_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';

class StripServices {
  final ApiServices apiServices = ApiServices();

// frist step
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModle) async {
    var responce = await apiServices.post(
        body: paymentIntentInputModle.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(responce.data);

    return paymentIntentModel;
  }

// second step

  Future initPaymentSheet(
      {required InitPaymentInputSheetModel initPaymentInputSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret:
                initPaymentInputSheetModel.paymentIntentClientSecret,
            customerEphemeralKeySecret:
                initPaymentInputSheetModel.customerEphemeralKeySecret,
            customerId: initPaymentInputSheetModel.customerId,
            merchantDisplayName: 'Hussein'));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // frist step
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var responce = await apiServices.post(
        body: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2024-06-20'
        });

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(responce.data);

    return ephemeralKeyModel;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentInputSheetModel = InitPaymentInputSheetModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        customerEphemeralKeySecret: ephemeralKeyModel.secret!,
        customerId: paymentIntentInputModel.customerId);

    await initPaymentSheet(
        initPaymentInputSheetModel: initPaymentInputSheetModel);

    await displayPaymentSheet();
  }
}

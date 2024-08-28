class InitPaymentInputSheetModel {
  final String paymentIntentClientSecret;

  final String customerEphemeralKeySecret;

  final String customerId;

  InitPaymentInputSheetModel(
      {required this.paymentIntentClientSecret,
      required this.customerEphemeralKeySecret,
      required this.customerId});
}

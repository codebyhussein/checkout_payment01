// ignore: non_constant_identifier_names
import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar({
  void Function()? onPressed,
  final String? title,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back_ios_new_outlined)),
    centerTitle: true,
    title: Text(
      title ?? '',
      style: Styles.style25,
    ),
  );
}

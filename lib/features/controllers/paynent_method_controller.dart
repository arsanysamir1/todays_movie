import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  RxString cardNumber = "".obs;
  RxString expireDate = "".obs;
  RxString holderName = "".obs;
  RxString cvvNumber = "".obs;
  Rx<CardType?> brandName = Rx<CardType?>(null);
  Rx<bool> isCvvFocused = false.obs;

  InputConfiguration input = const InputConfiguration(
    cardHolderDecoration: InputDecoration(
      hintText: "Enter the card Holder Name",
      labelText: "Card Holder",
      border: OutlineInputBorder(),
    ),
    cvvCodeDecoration: InputDecoration(
      hintText: "Enter the CVV code",
      labelText: "CVV Code",
      border: OutlineInputBorder(),
    ),
    cardNumberDecoration: InputDecoration(
      hintText: "Enter the Card Number",
      labelText: "Card Number",
      border: OutlineInputBorder(),
    ),
    expiryDateDecoration: InputDecoration(
      hintText: "card's Expire Date",
      labelText: "Expire Date",
      border: OutlineInputBorder(),
    ),
  );

  void onCreditCardModelChange(CreditCardModel data) {
    cardNumber.value = data.cardNumber;
    expireDate.value = data.expiryDate;
    cvvNumber.value = data.cvvCode;
    isCvvFocused.value = data.isCvvFocused;
    // CRITICAL: Update holder name so it reflects on the card widget
    holderName.value = data.cardHolderName;
  }

  void onCreditCardWidgetChange(CreditCardBrand data) {
    // Only update if it finds a valid brand, otherwise let the widget handle it
    if ( data.brandName != brandName.value) {
      Future.delayed(Duration.zero, () {
        brandName.value = data.brandName;
      });
    }
  }
}


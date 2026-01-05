import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:todays_movie/util/validators/credit_card_validation.dart';

import '../controllers/paynent_controller.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key});

  GlobalKey<FormState> paymentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final controller = Get.put(PaymentController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), Colors.purple.shade900],
            stops: [0.0, 0.4],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 10,
              color: Colors.transparent,
              child: SizedBox(
                width: width,
                child: Obx(
                      () =>
                      CreditCardWidget(
                        cardNumber: controller.cardNumber.value,
                        expiryDate: controller.expireDate.value,
                        cardHolderName: controller.holderName.value,
                        cvvCode: controller.cvvNumber.value,
                        showBackView: controller.isCvvFocused.value,

                        cardType: controller.brandName.value,
                        onCreditCardWidgetChange: (CreditCardBrand brand) {
                          controller.onCreditCardWidgetChange(brand);
                        },

                        isHolderNameVisible: true,

                        obscureCardNumber: false,
                        cardBgColor: Colors.purple,
                      ),
                ),
              ),
            ),
            CreditCardForm(

              cardNumberValidator: (value) =>
                  CreditCardValidator.validateCardNumber(value),
              expiryDateValidator:(value) => CreditCardValidator.validateExpiry(value),
              cvvValidator:(value) => CreditCardValidator.validateCVV(value),
              inputConfiguration: controller.input,
              cardNumber: controller.cardNumber.value,
              expiryDate: controller.expireDate.value,
              cardHolderName: controller.holderName.value,
              cvvCode: controller.cvvNumber.value,
              onCreditCardModelChange: (data) {
                controller.onCreditCardModelChange(data);
              },
              obscureCvv: false,
              formKey: paymentKey,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  if (paymentKey.currentState!.validate()) {
                    Get.back();
                  }
                },
                child: Text("Confirm Card"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

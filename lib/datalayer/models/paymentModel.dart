

import 'package:shoping/domain/entites/paymentEntites.dart';

class PaymentModel extends PaymentEntites{
  PaymentModel({required String paymentUrl})
      : super(paymentUrl);

  factory PaymentModel.fromJson(Map<String,dynamic>json){
    return PaymentModel(
        paymentUrl: json["url"]);
  }
}
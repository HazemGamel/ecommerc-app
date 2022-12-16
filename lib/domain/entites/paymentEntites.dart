
import 'package:equatable/equatable.dart';

class PaymentEntites extends Equatable{
  final String paymentUrl;

  PaymentEntites(this.paymentUrl);

  @override
  // TODO: implement props
  List<Object?> get props => [paymentUrl];

}

import 'package:equatable/equatable.dart';

class AddProductToCartEntites extends Equatable {
  final String status;
  final String message;

 const AddProductToCartEntites(this.status, this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [status,message];

}


import 'package:equatable/equatable.dart';

class AddAddressEntites extends Equatable {
  final String Status;
  final String message;

 const AddAddressEntites(this.Status, this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [Status,message];

}
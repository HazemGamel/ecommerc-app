
import 'package:equatable/equatable.dart';

class AddAddressRequest extends Equatable{
  final String place;
  final String city;
  final String phone;
  final String street;
  final String pstalcode;

  AddAddressRequest(this.place, this.city, this.phone, this.street, this.pstalcode);

  @override
  // TODO: implement props
  List<Object?> get props =>[place,city,phone,street,pstalcode];

}

import 'package:equatable/equatable.dart';

class RegisterResponseEntity extends Equatable {
final Data? data;
final  String? token;
 const RegisterResponseEntity(this.data, this.token);
  @override
  // TODO: implement props
  List<Object?> get props => [data,token];
}

class Data extends Equatable{
 final String? id;
 final String? name;
 final String? email;
 final String? role;

 Data( this.id, this.name,this.email, this.role);

 // TODO: implement props
 @override
 List<Object?> get props => [
  id,name,email,role
 ];
}


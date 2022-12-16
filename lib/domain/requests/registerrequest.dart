
import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable{
  final String username;
  final String email;
  final String password;
  final String confirmpassword;

 const RegisterRequest(
  {
    required this.username,
    required  this.email,
    required this.password,
     required  this.confirmpassword
     }
     );

  @override
  // TODO: implement props
  List<Object?> get props => [
    username,email,password,confirmpassword
  ];
}
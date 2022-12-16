
import 'package:equatable/equatable.dart';

class EmailRequest extends Equatable{
  final String email;
 const EmailRequest({required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => [email];

}
//code request

class CodeRequest extends Equatable{
  final String code;
  const CodeRequest({required this.code});
  @override
  // TODO: implement props
  List<Object?> get props => [code];

}
//restpassword requst emial ,newpassword
class NewPasswordRequest extends Equatable{
  final String email;
  final String newpassword;

const  NewPasswordRequest({required this.email, required this.newpassword});
  @override
  // TODO: implement props
  List<Object?> get props => [email,newpassword];

}
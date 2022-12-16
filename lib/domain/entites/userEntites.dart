
import 'package:equatable/equatable.dart';

class UserEntites extends Equatable{
  final String id;
  final String name;
  final String email;
  final String? profileimage;

  UserEntites(this.id, this.name, this.email, this.profileimage);

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,email,profileimage];

}
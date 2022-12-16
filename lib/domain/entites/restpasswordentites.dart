import 'package:equatable/equatable.dart';

 class ResetPasswordEntities extends Equatable {
 final String token;

  const ResetPasswordEntities(this.token);
  @override
  // TODO: implement props
  List<Object?> get props => [token];

}
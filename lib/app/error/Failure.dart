import 'package:equatable/equatable.dart';
import 'package:shoping/app/error/messageError.dart';

abstract class Failure extends Equatable{
  final String message;
 const Failure(this.message);
}

//error like status message
 class ServerFailure extends Failure{
 const ServerFailure(String message) : super(message);
  @override
  // TODO: implement props
  List<Object?> get props => [super.message];
}
//error like array of errors
class ArrayOfErrorsFailure extends Failure{
  ArrayOfErrorsFailure(String message) : super(message);

  @override
  // TODO: implement props
  List<Object?> get props => [super.message];

}
//error in internet
class offlineFailure extends Failure{
  offlineFailure(String message) : super(message);

  @override
  // TODO: implement props
  List<Object?> get props => [super.message];


}

//class ErrorFailure extends Failure{
//  final String message;
//
//  ErrorFailure(this.message);
//
//  @override
//  // TODO: implement props
//  List<Object?> get props => [];
//
//}
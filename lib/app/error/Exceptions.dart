
import 'package:shoping/app/error/arrayofmessageerror.dart';
import 'package:shoping/app/error/messageError.dart';

class ServerException implements Exception{
  final ErrorModel errorModel;

  ServerException(this.errorModel);

}

class ArrayOfErrorsException implements Exception{
  final ArrayOfErrors arrayOfErrors;

  ArrayOfErrorsException(this.arrayOfErrors);

}
class OfflineException implements Exception{
}

//class ErrorException implements Exception{
//  final ErrorModel errorModel;
// const ErrorException(this.errorModel);
//}
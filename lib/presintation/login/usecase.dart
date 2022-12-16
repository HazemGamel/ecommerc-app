import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/registerresponseentites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';
import 'package:shoping/domain/requests/loginrequest.dart';
import 'package:shoping/domain/requests/registerrequest.dart';

class LoginUseCase{
  final BaseRepository _baseRepository;
 const LoginUseCase(this._baseRepository);
 Future<Either<Failure,RegisterResponseEntity>>execute(LoginRequest loginRequest)async{
    return  await _baseRepository.login(loginRequest);
  }
}
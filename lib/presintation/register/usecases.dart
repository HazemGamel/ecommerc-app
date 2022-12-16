import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Exceptions.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/datalayer/models/registerResponseModel.dart';
import 'package:shoping/domain/entites/registerresponseentites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';
import 'package:shoping/domain/requests/registerrequest.dart';

class RegisterUseCase {

  final BaseRepository baseRepository;
  RegisterUseCase(this.baseRepository);

  Future<Either<Failure,RegisterResponseEntity>> execute(RegisterRequest registerRequest)async{
    return await baseRepository.register(registerRequest);
  }

}
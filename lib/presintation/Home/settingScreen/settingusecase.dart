
import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/userEntites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';

class UserUseCase {
  final BaseRepository baseRepository;
  UserUseCase(this.baseRepository);
  Future<Either<Failure,UserEntites>> execuiteUserData()async{
    return baseRepository.getUserData();
  }
}
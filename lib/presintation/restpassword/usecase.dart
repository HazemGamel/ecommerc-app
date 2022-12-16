import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/restpasswordentites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';
import 'package:shoping/domain/requests/restpasswordrequest.dart';

class CheckEmailUseCase{
  final BaseRepository baseRepository;

  CheckEmailUseCase(this.baseRepository);

 Future<Either<Failure,Unit>> execute(EmailRequest emailRequest)async{
    return await baseRepository.sendEmailToRestPassword(emailRequest);
  }

}
//code usecase
class CheckCodeUseCase{
  final BaseRepository baseRepository;

  CheckCodeUseCase(this.baseRepository);

  Future<Either<Failure,Unit>> execute(CodeRequest codeRequest)async{
    return await baseRepository.sendCodeToRestPassword(codeRequest);
  }

}

//restpassword usecase
class RestPasswordUseCase{
  final BaseRepository baseRepository;

  RestPasswordUseCase(this.baseRepository);

  Future<Either<Failure,ResetPasswordEntities>>
  execute(NewPasswordRequest newPasswordRequest)async{
    return await baseRepository.
    sendEmailAndNewPassToRestPassword(newPasswordRequest);
  }

}
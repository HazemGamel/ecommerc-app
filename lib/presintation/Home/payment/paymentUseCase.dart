
import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/paymentEntites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';

class PaymentUseCase{
  final BaseRepository baseRepository;

  PaymentUseCase(this.baseRepository);

  Future<Either<Failure,PaymentEntites>> exexutepayment(id)async{
    return baseRepository.paymentSession(id);
  }
}
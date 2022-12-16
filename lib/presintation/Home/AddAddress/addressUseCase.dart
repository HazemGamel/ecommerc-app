
import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/addAddressEntites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';
import 'package:shoping/domain/requests/addAddressRequest.dart';

class AddressUseCase{
  final BaseRepository baseRepository;

 const AddressUseCase(this.baseRepository);

 Future<Either<Failure,AddAddressEntites>> executeAddAddress(AddAddressRequest addAddressRequest)async{
   return baseRepository.addAddress(addAddressRequest);
 }

}
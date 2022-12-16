
import 'package:equatable/equatable.dart';

class FavoriteEntites extends Equatable{
  final String status;
  final String message;

 const FavoriteEntites(this.status, this.message);

  @override
  // TODO: implement props
  List<Object?> get props =>[status,message];


}
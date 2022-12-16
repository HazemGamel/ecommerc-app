
import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/SearchProductEntites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';

class SearchUseCase{
  final BaseRepository _baseRepository;

  SearchUseCase(this._baseRepository);

  Future<Either<Failure,List<SearchProductEntites>>> execuiteSearch(text)async{
    return _baseRepository.searchProducts(text);
  }
}
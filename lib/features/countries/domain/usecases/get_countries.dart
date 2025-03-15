import 'package:dartz/dartz.dart';
import 'package:samim_rayane_project/features/countries/domain/enttites/country.dart';
import '../repositories/country_repository.dart';

class GetCountries {
  final CountryRepository repository;

  GetCountries({required this.repository});

  Future<Either<String, List<Country>>> call() {
    return repository.getCountries();
  }
}

import 'package:dartz/dartz.dart';
import 'package:samim_rayane_project/features/countries/domain/enttites/country.dart';

abstract class CountryRepository {
  Future<Either<String, List<Country>>> getCountries();
}

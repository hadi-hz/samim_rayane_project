import 'package:dartz/dartz.dart';
import 'package:samim_rayane_project/features/countries/data/datasources/country_data.dart';
import 'package:samim_rayane_project/features/countries/domain/enttites/country.dart';
import '../../domain/repositories/country_repository.dart';
import '../models/country_model.dart';

class CountryDataRepository implements CountryRepository {
  final CountryDataSources remoteDataSource;

  CountryDataRepository({required this.remoteDataSource});

  @override
  Future<Either<String, List<Country>>> getCountries() async {
    try {
      final List<CountryModel> countries = await remoteDataSource.getCountries();
      return Right(countries);
    } catch (e) {
      return Left('خطا در دریافت لیست کشورها');
    }
  }
}

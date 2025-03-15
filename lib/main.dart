import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:samim_rayane_project/features/countries/data/datasources/country_data.dart';
import 'package:samim_rayane_project/features/countries/data/repositories/data_country_repository.dart';
import 'package:samim_rayane_project/features/countries/presentation/bloc/country_event.dart';
import 'package:samim_rayane_project/features/countries/presentation/pages/country_page.dart';
import 'features/countries/presentation/bloc/country_bloc.dart';
import 'features/countries/domain/usecases/get_countries.dart';

void main() {
  final dio = Dio();
  final remoteDataSource = CountryDataSource(dio: dio);
  final repository = CountryDataRepository(remoteDataSource: remoteDataSource);
  final getCountries = GetCountries(repository: repository);

  runApp(CountryApp(getCountries: getCountries));
}

class CountryApp extends StatelessWidget {
  final GetCountries getCountries;

  CountryApp({required this.getCountries});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CountryBloc(getCountries: getCountries)..add(GetCountryList()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa', 'IR'),
        home: CountryListPage(),
      ),
    );
  }
}

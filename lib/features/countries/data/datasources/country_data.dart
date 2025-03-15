import 'dart:convert';

import 'package:samim_rayane_project/features/countries/data/models/country_model.dart';
import 'package:dio/dio.dart';

abstract class CountryDataSources {
  Future<List<CountryModel>> getCountries();
}

class CountryDataSource implements CountryDataSources {
  final Dio dio;

  CountryDataSource({required this.dio});

  @override
  Future<List<CountryModel>> getCountries() async {
    try {
      final response = await dio.get(
          'https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json');
          print("response..............${response.data}");
      List<dynamic> data = jsonDecode(response.data);
      print("daataa............${data}");

      if (response.statusCode == 200) {
        return data
            .map<CountryModel>((json) => CountryModel.fromJson(json))
            .toList();
      } else {
        throw Exception('خطا در دریافت داده‌ها');
      }
    } catch (e) {
      throw Exception('خطای درخواست: $e');
    }
  }
}

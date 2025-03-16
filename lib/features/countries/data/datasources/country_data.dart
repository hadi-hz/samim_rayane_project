import 'dart:convert';

import 'package:samim_rayane_project/core/network/dio_client.dart';
import 'package:samim_rayane_project/features/countries/data/models/country_model.dart';

abstract class CountryDataSources {
  Future<List<CountryModel>> getCountries();
}

class CountryDataSource implements CountryDataSources {
  final DioClient dio;

  CountryDataSource({required this.dio});

  @override
  Future<List<CountryModel>> getCountries() async {
    try {
      final response = await dio.get('refs/heads/main/countries.json');
      print("response..............${response.data}");
      List<dynamic> data = jsonDecode(response.data);

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

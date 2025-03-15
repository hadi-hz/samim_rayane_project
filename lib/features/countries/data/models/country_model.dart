import 'package:samim_rayane_project/features/countries/domain/enttites/country.dart';

class CountryModel extends Country {
  CountryModel({
    required String name,
    required String capital,
    required String code,
    required String flag,
  }) : super(name: name, capital: capital, code: code, flag: flag);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
        name: json['name'],
        capital: json['capital'],
        code: json['code'],
        flag: json['flag']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'capital': capital,
      'code': code,
      'flag': flag,
    };
  }
}

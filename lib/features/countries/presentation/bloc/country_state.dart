import 'package:samim_rayane_project/features/countries/domain/enttites/country.dart';

abstract class CountryState {
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;

  CountryLoaded({required this.countries});
}

class CountryError extends CountryState {
  final String message;

  CountryError({required this.message});
}

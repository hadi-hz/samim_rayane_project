import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_countries.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries getCountries;

  CountryBloc({required this.getCountries}) : super(CountryInitial()) {
    on<GetCountryList>((event, emit) async {
      emit(CountryLoading());
      final result = await getCountries();

      result.fold(
        (failure) => emit(CountryError(message: failure)),
        (countries) => emit(CountryLoaded(countries: countries)),
      );
    });
  }
}

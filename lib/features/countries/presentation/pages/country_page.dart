import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samim_rayane_project/core/constant.dart';
import 'package:samim_rayane_project/features/countries/presentation/bloc/country_bloc.dart';
import 'package:samim_rayane_project/features/countries/presentation/bloc/country_state.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class CountryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.primary,
        appBar: AppBar(
            centerTitle: true,
            elevation: 5,
            backgroundColor: ThemeColor.backgroundBox,
            title: Text(
              'کشورها',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: ThemeColor.textColor),
            )),
        body: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case CountryLoading:
                return Center(child: CircularProgressIndicator());

              case CountryLoaded:
                final loadedState = state as CountryLoaded;
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    padding:
                        EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
                    itemCount: loadedState.countries.length,
                    itemBuilder: (context, index) {
                      final country = loadedState.countries[index];
                      return Container(
                        padding: EdgeInsetsDirectional.only(start: 16),
                        margin: EdgeInsetsDirectional.only(bottom: 8),
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ThemeColor.backgroundBox,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.network(country.flag),
                            ),
                            SizedBox(width: 10),
                            Text(
                              country.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: ThemeColor.textColor,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.location_city,
                              color: ThemeColor.primarytext,
                            ),
                            SizedBox(width: 5),
                            Text(
                              country.capital,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: ThemeColor.textColor,
                              ),
                            ),
                            SizedBox(width: 16),
                          ],
                        ),
                      );
                    },
                  ),
                );

              case CountryError:
                final errorState = state as CountryError;
                return Center(
                  child: Text(
                    errorState.message,
                    style: TextStyle(color: ThemeColor.textColor),
                  ),
                );

              default:
                return Center(
                  child: Text(
                    'داده‌ای موجود نیست',
                    style: TextStyle(color: ThemeColor.textColor),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

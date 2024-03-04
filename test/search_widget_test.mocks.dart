// Mocks generated by Mockito 5.4.4 from annotations
// in weatherforecast/test/search_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:weatherforecast/models/geocoding_model.dart' as _i5;
import 'package:weatherforecast/models/weather_model.dart' as _i2;
import 'package:weatherforecast/services/open_meteo.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWeatherData_0 extends _i1.SmartFake implements _i2.WeatherData {
  _FakeWeatherData_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [OpenMeteoService].
///
/// See the documentation for Mockito's code generation for more information.
class MockOpenMeteoService extends _i1.Mock implements _i3.OpenMeteoService {
  MockOpenMeteoService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.WeatherData> fetchWeatherData({
    required String? latitude,
    required String? longitude,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchWeatherData,
          [],
          {
            #latitude: latitude,
            #longitude: longitude,
          },
        ),
        returnValue: _i4.Future<_i2.WeatherData>.value(_FakeWeatherData_0(
          this,
          Invocation.method(
            #fetchWeatherData,
            [],
            {
              #latitude: latitude,
              #longitude: longitude,
            },
          ),
        )),
      ) as _i4.Future<_i2.WeatherData>);

  @override
  _i4.Future<List<_i5.SearchResult>> fetchGeocodingData(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchGeocodingData,
          [name],
        ),
        returnValue:
            _i4.Future<List<_i5.SearchResult>>.value(<_i5.SearchResult>[]),
      ) as _i4.Future<List<_i5.SearchResult>>);
}

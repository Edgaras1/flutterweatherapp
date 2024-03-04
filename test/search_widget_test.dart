import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter/material.dart';
import 'package:weatherforecast/models/geocoding_model.dart';
import 'package:weatherforecast/services/open_meteo.dart';
import 'package:weatherforecast/widgets/search_widget.dart';

@GenerateMocks([OpenMeteoService])
import 'search_widget_test.mocks.dart';

class MockFunction extends Mock {
  void call();
}

void main() {
  group('buildWeekForecast', () {
    testWidgets('test suggestions', (tester) async {
      final List<SearchResult> searchMockResult = [
        SearchResult(
          country: "Iran",
          countryCode: "IR",
          featureCode: "PPL",
          elevation: 932.0,
          name: "Borūn",
          latitude: 27.9,
          longitude: 54.1,
          id: 68915,
          admin1Id: null,
          admin2Id: null,
          admin3Id: null,
          admin4Id: null,
          timezone: '',
          population: null,
          postcodes: [],
          countryId: null,
          admin1: '',
          admin2: '',
          admin3: '',
          admin4: '',
        ),
      ];

      final opemMeteoService = MockOpenMeteoService();
      when(opemMeteoService.fetchGeocodingData(any))
          .thenAnswer((_) => Future.value(searchMockResult));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: buildSearchWidget(
                onSelected: (_) => {},
                suggestions: (String query) {
                  return opemMeteoService.fetchGeocodingData(query);
                }),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Bor');
      await tester.pumpAndSettle();
      expect(find.text('Borūn'), findsOneWidget);
    });
  });
}

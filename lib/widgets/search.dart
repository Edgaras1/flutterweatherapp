import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weatherforecast/models/geocoding_model.dart';
import 'package:weatherforecast/services/open_meteo.dart';

Widget buildSearchWidget({required Function(SearchResult result) onSelected}) {
  TextEditingController controller = TextEditingController();

  return TypeAheadField(
    controller: controller,
    builder: (context, controller, focusNode) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
            controller: controller,
            focusNode: focusNode,
            // autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search location',
              prefixIcon: Icon(Icons.search),
            )),
      );
    },
    hideOnEmpty: true,
    itemBuilder: (context, result) {
      return ListTile(
        title: Text(result.name),
        subtitle: Text(result.country ?? ''),
      );
    },
    decorationBuilder: (context, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          type: MaterialType.card,
          elevation: 4,
          child: child,
        ),
      );
    },
    onSelected: (result) {
      onSelected(result as SearchResult);
      controller.clear();
    },
    debounceDuration: const Duration(milliseconds: 1000),
    suggestionsCallback: (String search) async {
      return search.isNotEmpty ? await fetchGeocodingData(search) : [];
    },
  );
}

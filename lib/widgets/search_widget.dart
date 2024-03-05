import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weatherforecast/models/geocoding_model.dart';

Widget buildSearchWidget({
  required Function(SearchResult result) onSelected,
  required Future<List<SearchResult>> Function(String query) suggestions,
}) {
  TextEditingController controller = TextEditingController();

  return TypeAheadField(
    controller: controller,
    builder: (context, controller, focusNode) {
      return SizedBox(
        height: 40,
        child: TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              labelText: 'Search location',
              prefixIcon: const Icon(Icons.search),
            )),
      );
    },
    hideOnSelect: true,
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
      // controller.clear();
    },
    debounceDuration: const Duration(milliseconds: 400),
    suggestionsCallback: (String search) async {
      return search.isNotEmpty ? await suggestions(search) : [];
    },
  );
}

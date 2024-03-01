class GeocodingSearchResponse {
  List<SearchResult> results;
  double generationtimeMs;

  GeocodingSearchResponse({
    required this.results,
    required this.generationtimeMs,
  });

  factory GeocodingSearchResponse.fromJson(Map<String, dynamic> json) {
    final results = (json['results'] as List?)
        ?.map((item) => SearchResult.fromJson(item))
        .toList();
    return GeocodingSearchResponse(
      results: results ?? [],
      generationtimeMs: json['generationtime_ms'] as double,
    );
  }
}

class SearchResult {
  int id;
  String name;
  double latitude;
  double longitude;
  double elevation;
  String featureCode;
  String countryCode;
  int? admin1Id;
  int? admin2Id;
  int? admin3Id;
  int? admin4Id;
  String? timezone;
  int? population;
  List<String>? postcodes;
  int? countryId;
  String? country;
  String? admin1;
  String? admin2;
  String? admin3;
  String? admin4;

  SearchResult({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.admin1Id,
    required this.admin2Id,
    required this.admin3Id,
    required this.admin4Id,
    required this.timezone,
    required this.population,
    required this.postcodes,
    required this.countryId,
    required this.country,
    required this.admin1,
    required this.admin2,
    required this.admin3,
    required this.admin4,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        id: json['id'] as int,
        name: json['name'] as String,
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double,
        elevation: json['elevation'] as double,
        featureCode: json['feature_code'] as String,
        countryCode: json['country_code'] as String,
        admin1Id: json['admin1_id'] as int?,
        admin2Id: json['admin2_id'] as int?,
        admin3Id: json['admin3_id'] as int?,
        admin4Id: json['admin4_id'] as int?,
        timezone: json['timezone'] as String?,
        population: json['population'] as int?,
        postcodes: (json['postcodes'] as List?)?.cast<String>(),
        countryId: json['country_id'] as int?,
        country: json['country'] as String?,
        admin1: json['admin1'] as String?,
        admin2: json['admin2'] as String?,
        admin3: json['admin3'] as String?,
        admin4: json['admin4'] as String?,
      );
}

class GeocodingResult {
  final String name;
  final double latitude;
  final double longitude;
  final String? state;
  final String? country;

  const GeocodingResult({
    required this.name,
    required this.latitude,
    required this.longitude,
    this.state,
    this.country,
  });

  factory GeocodingResult.fromJson(Map<String, dynamic> json,) {
    return GeocodingResult(
      name: json['name'] as String,
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['lon'] as num).toDouble(),
      state: json['state'] as String?,
      country: json['country'] as String?,
    );
  }

}
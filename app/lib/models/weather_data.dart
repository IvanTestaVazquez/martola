class WeatherData {
  final double temperature;
  final int humidity;
  final String description;
  final double windSpeed;
  final String city;

  const WeatherData({
    required this.temperature,
    required this.humidity,
    required this.description,
    required this.windSpeed,
    required this.city,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json,) {
    return WeatherData(
      temperature: (json['main']['temp'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      description: json['weather'][0]['description'] as String,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      city: json['name'] as String,
    );
  }
}
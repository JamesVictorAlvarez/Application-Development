import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_request.g.dart';

@RestApi (baseUrl :"https://api.open-meteo.com/v1/forecast?latitude=45.57&longitude=-73.69&hourly=temperature_2m,relativehumidity_2m,rain,windspeed_10m ")
abstract class RestClient {
  factory RestClient (Dio dio, {String baseUrl}) = _RestClient;
  @GET("")
  Future<List<FetchPost>> getPost();
}

@JsonSerializable()
class FetchPost {
  Hourly hourly;

  FetchPost({required this.hourly});

  factory FetchPost.fromJson(Map<String, dynamic> json) =>
      _$FetchPostFromJson(json);
  Map<String, dynamic> toJson() => _$FetchPostToJson(this);
}

class Hourly {
  String time;
  int temperature_2m;
  int relativehumidity_2m;
  int rain;
  int windspeed_10m;

  Hourly({required this.time, required this.temperature_2m, required this.relativehumidity_2m,
    required this.rain, required this.windspeed_10m});

  factory Hourly.fromJson(Map<String, dynamic> json) =>
      _$HourlyFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
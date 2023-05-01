// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchPost _$FetchPostFromJson(Map<String, dynamic> json) => FetchPost(
      hourly: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FetchPostToJson(FetchPost instance) => <String, dynamic>{
      'hourly': instance.hourly,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
  time: json['time'] as String,
  temperature_2m: json['temperature_2m'] as int,
  relativehumidity_2m: json['relativehumidity_2m'] as int,
  rain: json['rain'] as int,
  windspeed_10m: json['windspeed_10m'] as int,
);

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
  'time': instance.time,
  'temperature_2m': instance.temperature_2m,
  'relativehumidity_2m': instance.relativehumidity_2m,
  'rain': instance.rain,
  'windspeed_10m': instance.windspeed_10m,
};

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://api.open-meteo.com/v1/forecast?latitude=45.57&longitude=-73.69&hourly=temperature_2m,relativehumidity_2m,rain,windspeed_10m ';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<FetchPost>> getPost() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<FetchPost>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => FetchPost.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

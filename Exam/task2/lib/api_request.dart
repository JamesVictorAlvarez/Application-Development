import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_request.g.dart';

@RestApi (baseUrl :"https://api.jsonserve.com/gF7Dgj")
abstract class RestClient {
  factory RestClient (Dio dio, {String baseUrl}) = _RestClient;
  @GET("")
  Future<List<FetchPost>> getPost();
}

@JsonSerializable()
class FetchPost {
  int? id;
  String? type;
  String? name;

  FetchPost({this.id, this.type, this.name});

  factory FetchPost.fromJson(Map<String, dynamic> json) =>
      _$FetchPostFromJson(json);
  Map<String, dynamic> toJson() => _$FetchPostToJson(this);
}

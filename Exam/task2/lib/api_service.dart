import 'package:http/http.dart' as http;
import '/model.dart';
import './constant.dart';

class ApiService {
  Future<List <Model>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Model> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
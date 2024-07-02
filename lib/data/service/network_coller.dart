import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/responce_data.dart';

class NetworkCaller {
  Future<ResponceData> getRequest(String uri) async {
    print(uri);
    final http.Response response = await http.get(Uri.parse(uri));
    print(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      return ResponceData(
        isSuccess: true,
        statusCode: response.statusCode,
        responceData: decoded,
      );
    } else {
      return ResponceData(
        isSuccess: false,
        responceData: '',
        statusCode: response.statusCode,
      );
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  static final String baseURL = "https://jsonplaceholder.typicode.com/";
  static final String updateProfileURL = baseURL + "updateProfile";
}
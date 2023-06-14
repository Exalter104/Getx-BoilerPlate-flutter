import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_boilerplate/data/app_exceptions.dart';
import 'package:getx_boilerplate/data/networks/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
//*..................................GET API....................................

  @override
  Future getApi(String url) async {
    if (kDebugMode) {
      print("The GetApi url is for testing :$url");
    }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponseJson(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimout {
      throw RequestTimout();
    }
    return responseJson;
  }

//*..................................POST API...................................
  @override
  Future postApi(var data, String url) async {
    if (kDebugMode) {
      print("The PostApi url is for testing :$url and Data is $data");
    }
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponseJson(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimout {
      throw RequestTimout();
    }
    return responseJson;
  }

  returnResponseJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJsn = jsonDecode(response.body);
        return responseJsn;
      case 400:
        throw InvalidUrlException();
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            "Error while communicating ${response.statusCode.toString()}");
    }
  }
}

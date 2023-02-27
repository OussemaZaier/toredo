import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:toredo/models/customer.dart';
import 'package:toredo/models/login.dart';

class APIService {
  void createCustomer(CustomerModel customer) async {
    String KEY = dotenv.env['KEY'].toString();
    String SECRET = dotenv.env['SECRET'].toString();
    String URL = dotenv.env['URL'].toString();
    String fullURL = dotenv.env['customerURL'].toString();
    var authToken = base64.encode(utf8.encode(KEY + ':' + SECRET));
    try {
      print(customer.toJSON());
      var res = await Dio().post(
        URL + fullURL,
        data: customer.toJSON(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      print('------here1----------');
      print(authToken);
      print('----------------');
      print(res.statusCode);
      print('----------------');
      print(res.data);
      print('----------------');
    } on DioError catch (e) {
      print('---------error-------');
      print(e.response);
      print('----------------');
    }
  }

  void loginCustomer(String email, String username, String password) async {
    LoginModel model;
    try {
      var response = await Dio().post(
        dotenv.env['tokenURL'].toString(),
        data: {
          'username': username,
          'password': password,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
          },
        ),
      );
      if (response.statusCode == 200) {
        model = LoginModel.fromJSON(response.data);
      }
      print('success');
      print(response.data);
    } on DioError catch (e) {
      print('error');
      print(e.message);
    }
    //return model;
  }
}

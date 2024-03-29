import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:toredo/components/category.dart';
import 'package:toredo/models/customer.dart';
import 'package:toredo/models/login.dart';

abstract class APIService {
  static Future createCustomer(CustomerModel customer) async {
    String KEY = dotenv.env['KEY'].toString();
    String SECRET = dotenv.env['SECRET'].toString();
    String URL = dotenv.env['URL'].toString();
    print(URL);
    String fullURL = dotenv.env['customerURL'].toString();
    var authToken = base64.encode(utf8.encode('$KEY:$SECRET'));
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
      return res;
    } catch (e) {
      if (e is DioError) {
        return e.response;
      }
      return e;
    }
  }

  static Future loginCustomer(String username, String password) async {
    LoginModel model;
    try {
      var res = await Dio().post(
        dotenv.env['tokenURL'].toString(),
        data: {
          'username': username,
          'password': password,
        },
        options: new Options(
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        ),
      );
      return res;
    } catch (e) {
      if (e is DioError) {
        return e.response;
      }
      return e;
    }
  }

  static Future validateToken(String token) async {
    try {
      var res = await Dio().post(
        dotenv.env['tokenValidateURL'].toString(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            "Authorization": "Bearer $token",
          },
        ),
      );
      return res;
    } catch (e) {
      if (e is DioError) {
        return e.response;
      }
      return e;
    }
  }

  static Future getProducts() async {
    String KEY = dotenv.env['KEY'].toString();
    String SECRET = dotenv.env['SECRET'].toString();
    String URL = dotenv.env['URL'].toString();
    String fullURL = URL + dotenv.env['productURL'].toString();
    var authToken = base64.encode(utf8.encode('$KEY:$SECRET'));
    try {
      var res = await Dio().get(
        fullURL,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      // return json.decode(res.toString());
      return res.data;
    } catch (e) {
      if (e is DioError) {
        return e.response;
      }
      return e;
    }
  }

  static Future getCategories() async {
    String KEY = dotenv.env['KEY'].toString();
    String SECRET = dotenv.env['SECRET'].toString();
    String URL = dotenv.env['URL'].toString();
    String fullURL = URL +
        dotenv.env['productURL'].toString() +
        "/" +
        dotenv.env['categoriesURL'].toString();
    var authToken = base64.encode(utf8.encode('$KEY:$SECRET'));
    try {
      var res = await Dio().get(
        fullURL,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      print(json.decode(res.toString()));
      return res.data;
    } catch (e) {
      if (e is DioError) {
        return e.response;
      }
      return e;
    }
  }
}

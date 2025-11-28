import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:task_management/app.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/controller/auth_controllers.dart';

class NetworkCaller {
  static Future<NetWorkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      // only for debug mode print #_logRequest(url)  #_logResponse(url, response)
      _logRequest(url);
      Response response = await get(
        uri,
        headers: {'token': AuthControllers.accesstoken ?? ''},
      );
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetWorkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } 
      else if(response.statusCode == 401){

        onUnAuthorized();
         return NetWorkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: 'un authorized'
        );



        

      }
      else {
        return NetWorkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData['data'],
        );
      }
    } catch (e) {
      return NetWorkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetWorkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      // only for debug mode print #_logRequest(url)  #_logResponse(url, response)
      _logRequest(url, body: body);
      Response response = await post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'token': AuthControllers.accesstoken ?? '',
        },
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetWorkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } 
       else if(response.statusCode == 401){

        onUnAuthorized();
         return NetWorkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: 'un authorized'
        );
       }
      else {
        return NetWorkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData['data'],
        );
      }
    } catch (e) {
      return NetWorkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<void> onUnAuthorized() async{
   
   await AuthControllers.clearUserData();
   Navigator.pushNamed(TaskManagementApp.navigatorKey.currentContext!,SignInScreen.name);
  }

  static void _logRequest(String url, {Map<String, dynamic>? body}) {
    debugPrint(
      'URL: $url\n'
      'Body: $body',
    );
  }

  static void _logResponse(String url, Response response) {
    debugPrint(
      'URL: $url\n'
      'Status Code: ${response.statusCode}\n'
      'Body: ${response.body}',
    );
  }
}

class NetWorkResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic body;
  final String errorMessage;

  NetWorkResponse({
    required this.isSuccess,
    required this.responseCode,
    this.body,
    this.errorMessage = 'something went wrong',
  });
}

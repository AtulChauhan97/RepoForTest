import 'dart:async';
import 'package:all_type_api/screens/user_model.dart';
import 'package:all_type_api/screens/user_req.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  static final dio = Dio();

  static Future<List<User>> getData() async {
    var url = "http://3.109.153.198:8080/user/all";
    debugPrint('getting 1');
    try {
      final response = await dio.get(url);
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        debugPrint('getting user data here');

        return (response.data as List).map((e) => User.fromJson(e)).toList();
      } else {
        debugPrint('getting error ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('EXC: ${e.toString()}');
      return [];
    }
  }

  static Future<List<User>> postData(UserReq userReq) async {
    var url = "http://3.109.153.198:8080/user/add";
    debugPrint('adding 1');
    try {
      final response = await dio.post(url,data: userReq.toJson());
      debugPrint('getting 2');
      if (response.statusCode == 200) {
        debugPrint('getting user data here');

        return (response.data as List).map((e) => User.fromJson(e)).toList();
      } else {
        debugPrint('getting error ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('EXC: ${e.toString()}');
      return [];
    }
  }

  static Future<bool> putData(UserReq userReq,String id) async {
    var url = "http://3.109.153.198:8080/user/$id";
    debugPrint('adding 1  $url');
    try {
      final response = await dio.put(url,data: userReq.toJson());
      debugPrint('getting 2');
      if (response.statusCode == 200) {
        debugPrint('getting user data here');

        return true;
      } else {
        debugPrint('getting error ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint('EXC: ${e.toString()}');
      return false;
    }
  }

  static Future<bool> deleteUserById(String id) async {
    var url = "http://3.109.153.198:8080/user/$id";
    debugPrint('adding 1');
    try {
      final response = await dio.delete(url);
      debugPrint('getting 2');
      if (response.statusCode == 200) {
        debugPrint('getting user data here');

        return true;
      } else {
        debugPrint('getting error ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint('EXC: ${e.toString()}');
      return false;
    }
  }

}

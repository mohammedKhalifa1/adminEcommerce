// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Curd {
  postData(String url, Map data) async {
    var request = await http.post(Uri.parse(url), body: data);
    if (request.statusCode == 200) {
      Map requestBody = jsonDecode(request.body);
      return requestBody;
    }
  }

  postRequestWithFile(String url, Map data, File file) async {
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var multiFile = http.MultipartFile("file", stream, length,
        filename: basename(file.path));
    request.files.add(multiFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var mySend = await request.send();
    var response = await http.Response.fromStream(mySend);
    if (mySend.statusCode == 200) {
      if (kDebugMode) {
        print("success send File_________");
      }
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print("Error In File_________${mySend.statusCode}");
      }
    }
  }
}

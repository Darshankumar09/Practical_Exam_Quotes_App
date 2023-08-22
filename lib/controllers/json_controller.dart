import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practical_exam/models/category_model.dart';
import 'package:practical_exam/models/json_model.dart';

class JsonController extends GetxController {
  LocalJsonModel localJsonModel = LocalJsonModel(jsonData: "", categories: []);

  Future<List<CategoryModel>> localJsonDecode() async {
    String path = "lib/resources/quotes.json";
    localJsonModel.jsonData = await rootBundle.loadString(path);

    List decodedList = jsonDecode(localJsonModel.jsonData);

    localJsonModel.categories =
        decodedList.map((e) => CategoryModel.fromMap(e)).toList();

    return localJsonModel.categories;
  }
}

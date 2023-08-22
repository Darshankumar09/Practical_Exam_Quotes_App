import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:practical_exam/models/quotes_model.dart';

class CategoryModel {
  int id;
  String categoryName;
  List<QuoteModel> quotes;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.quotes,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> data) => CategoryModel(
        id: data["category-id"],
        categoryName: data["quotes-category"],
        quotes: List<QuoteModel>.from(
          data["quotes"].map(
            (quote) => QuoteModel.fromMap(quote),
          ),
        ),
      );
}

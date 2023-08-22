import 'package:get_storage/get_storage.dart';
import 'package:practical_exam/models/category_database_model.dart';
import 'package:practical_exam/models/quotes_database_model.dart';

GetStorage getStorage = GetStorage();

Future<List<CategoryDatabaseModel>> allCategory =
    [] as Future<List<CategoryDatabaseModel>>;

Future<List<QuotesDatabaseModel>> allQuotes =
    [] as Future<List<QuotesDatabaseModel>>;

Future<List<QuotesDatabaseModel>> displayQuotes =
    [] as Future<List<QuotesDatabaseModel>>;

String dropDownSelect = "Select";

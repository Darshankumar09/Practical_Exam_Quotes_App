import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_exam/helpers/dbhelper.dart';
import 'package:practical_exam/models/category_database_model.dart';
import 'package:practical_exam/utils/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchAllCategory();
  }

  fetchAllCategory() {
    allCategory = DBHelper.dbHelper.fetchAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: allCategory,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<CategoryDatabaseModel>? data = snapshot.data;

            if (data!.isEmpty) {
              return const Center(
                child: Text("No data available"),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Select Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownMenu<String>(
                      initialSelection: dropDownSelect,
                      menuHeight: 200,
                      dropdownMenuEntries: List.generate(
                        (data.length + 1),
                        (index) => (index == 0)
                            ? const DropdownMenuEntry(
                                value: "Select", label: "Select")
                            : DropdownMenuEntry(
                                value: data[(index - 1)].categoryName,
                                label: data[(index - 1)].categoryName,
                              ),
                      ),
                      onSelected: (value) {
                        setState(() {
                          dropDownSelect = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (dropDownSelect != "Select") {
                          allQuotes = DBHelper.dbHelper
                              .fetchAllQuotes(categoryName: dropDownSelect);
                          Get.toNamed("/quote_page");
                        }
                      },
                      child: const Text("Next"),
                    ),
                  ],
                ),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

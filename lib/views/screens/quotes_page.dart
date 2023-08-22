import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_exam/helpers/dbhelper.dart';
import 'package:practical_exam/models/quotes_database_model.dart';
import 'package:practical_exam/utils/globals.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed("/displayed_quote_page");
            },
            child: const Text("Displayed Quotes"),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(dropDownSelect),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.home_outlined),
        ),
      ),
      body: FutureBuilder(
        future: allQuotes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<QuotesDatabaseModel>? data = snapshot.data;

            Random a = Random();

            int randomIndex = a.nextInt(data!.length);

            Timer(const Duration(seconds: 10), () {
              setState(() {
                randomIndex = a.nextInt(data.length);
                DBHelper.dbHelper.insertDisplayQuote(data: data[randomIndex]);
              });
            });

            if (data.isEmpty) {
              return const Center(
                child: Text("No data available"),
              );
            } else {
              return Center(
                child: Container(
                  height: 220,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data[randomIndex].quote,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "— ${data[randomIndex].quoteAuthor}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
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

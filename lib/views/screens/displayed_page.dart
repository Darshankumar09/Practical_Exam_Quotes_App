import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_exam/helpers/dbhelper.dart';
import 'package:practical_exam/models/quotes_database_model.dart';
import 'package:practical_exam/utils/globals.dart';

class DisplayedPage extends StatefulWidget {
  const DisplayedPage({super.key});

  @override
  State<DisplayedPage> createState() => _DisplayedPageState();
}

class _DisplayedPageState extends State<DisplayedPage> {
  @override
  void initState() {
    super.initState();
    displayQuotes = DBHelper.dbHelper.fetchDisplayQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Displayed Quotes"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FutureBuilder(
        future: displayQuotes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<QuotesDatabaseModel>? data = snapshot.data;

            if (data!.isEmpty) {
              return const Center(
                child: Text("No data available"),
              );
            } else {
              return ListView.builder(
                itemCount: data.length,
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                itemBuilder: (context, index) => Container(
                  height: 220,
                  width: 340,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % 18],
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
                          data[index].quote,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "— ${data[index].quoteAuthor}",
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

class QuoteModel {
  int id;
  String category;
  String quote;
  String author;

  QuoteModel({
    required this.id,
    required this.category,
    required this.quote,
    required this.author,
  });

  factory QuoteModel.fromMap(Map<String, dynamic> data) => QuoteModel(
        id: data["id"],
        category: data["category"],
        quote: data["quote"],
        author: data["author"],
      );
}

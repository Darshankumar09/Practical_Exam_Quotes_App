class QuotesDatabaseModel {
  int quoteId;
  String quoteCategory;
  String quote;
  String quoteAuthor;

  QuotesDatabaseModel({
    required this.quoteId,
    required this.quoteCategory,
    required this.quote,
    required this.quoteAuthor,
  });

  factory QuotesDatabaseModel.formMap({required Map data}) {
    return QuotesDatabaseModel(
      quoteId: data['quote_id'],
      quoteCategory: data['quote_category'],
      quote: data['quote'],
      quoteAuthor: data['author'],
    );
  }
}

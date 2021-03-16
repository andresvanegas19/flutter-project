class GlobalSummaryModel {
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final DateTime date;

  GlobalSummaryModel(
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.date,
  );

  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json) {
    return GlobalSummaryModel(
      json['Global']['newConfirmed'],
      json['Global']['totalConfirmed'],
      json['Global']['newDeaths'],
      json['Global']['totalDeaths'],
      json['Global']['newRecovered'],
      json['Global']['date'],
    );
  }
}

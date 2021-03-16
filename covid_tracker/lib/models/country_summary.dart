class CountrySummaryModel {
  final String country;
  final int confirmed;
  final int death;
  final int recovered;
  final int active;
  final DateTime date;

  CountrySummaryModel(
    this.country,
    this.confirmed,
    this.death,
    this.recovered,
    this.active,
    this.date,
  );

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) {
    return CountrySummaryModel(
      json['country'],
      json['confirmed'],
      json['death'],
      json['recovered'],
      json['active'],
      DateTime.parse(json['date']),
    );
  }
}

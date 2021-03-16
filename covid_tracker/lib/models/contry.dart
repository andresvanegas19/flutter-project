class CountryModel {
  final String country;
  final String slug;
  final String iso2;

  CountryModel(
    this.country,
    this.slug,
    this.iso2,
  );

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    // serializacion of the json they reciv
    return CountryModel(
      json["country"],
      json["slug"],
      json['iso2'],
    );
  }
}

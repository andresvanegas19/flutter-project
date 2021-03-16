import 'package:flutter/material.dart';
import '../services/covid_service.dart';
import '../models/country_summary.dart';
import '../models/contry.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

CovidServices covidServices = CovidServices();

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  TextEditingController _typeAheadController = TextEditingController();
  Future<List<CountryModel>> countryList;
  Future<List<CountrySummaryModel>> summaryList;

  @override
  void initState() {
    super.initState();
    countryList = covidServices.getCountryList();
    summaryList = covidServices.getCountrySummary("Qatar");

    this._typeAheadController.text = "Qatar";
  }

  List<String> _getSuggestion(List<CountryModel> list, String query) {
    List<String> matches = [];

    for (var item in list) {
      matches.add(item.country);
    }

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));

    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countryList,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text("Ocurr an erro"));

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: Text("loading"));
          default:
            return !snapshot.hasData
                ? Center(child: Text("Empty data not found"))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 6,
                        ),
                        child: Text(
                          "Type the country name",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _typeAheadController,
                          decoration: InputDecoration(
                            hintText: "Type the country name",
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(20),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 24, right: 16),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        suggestionsCallback: (pattern) =>
                            _getSuggestion(snapshot.data, pattern),
                        itemBuilder: (context, suggestion) {
                          return ListTile(title: Text(suggestion));
                        },
                        transitionBuilder:
                            (context, suggestionBox, controller) =>
                                suggestionBox,
                        onSuggestionSelected: (suggestion) {
                          this._typeAheadController.text = suggestion;
                          setState(() {
                            summaryList = covidServices.getCountrySummary(
                                snapshot.data
                                    .firstWhere((element) =>
                                        element.country == suggestion)
                                    .slug);
                          });
                        },
                      ),
                      SizedBox(height: 8),
                      FutureBuilder(
                        future: summaryList,
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            return Center(child: Text("Error"));
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(child: Text("loading"));
                            default:
                              return !snapshot.hasData
                                  ? Center(child: Text("empty"))
                                  : Center(child: Text("Has data"));
                          }

                          // }
                        },
                      ),
                    ],
                  );
        }
      },
    );
  }
}

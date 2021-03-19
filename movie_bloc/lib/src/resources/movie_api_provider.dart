import 'package:http/http.dart' show Client;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:async';
import 'dart:convert';

import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = env['API_MOVIES'];

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    String url = "http://api.themoviedb.org";

    final response = await client.get(
      Uri.https(
        url,
        "3/movie/popular?api_key=$_apiKey",
      ),
    );

    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}

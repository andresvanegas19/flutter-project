import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import './src/app.dart';

Future main() async {
  // NOTE: The filename will default to .env and doesn't need to be defined in this case
  await DotEnv.load(fileName: ".env");
  runApp(App());
  //...runapp
}

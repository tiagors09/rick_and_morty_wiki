import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_wiki/rick_and_morty_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  runApp(RickAndMortyApp());
}

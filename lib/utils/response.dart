import 'package:rick_and_morty_wiki/domain/models/info.dart';

class Response {
  final Info info;
  final List results;

  Response({required this.info, required this.results});
}

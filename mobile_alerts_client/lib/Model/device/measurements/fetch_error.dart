import 'package:http/http.dart';

class FetchError {
  int statusCode;
  String? reasonPhrase;
  String body;
  DateTime time;

  FetchError(this.statusCode, this.reasonPhrase, this.body)
      : time = DateTime.now();
  FetchError.fromResponse(Response r)
      : this(r.statusCode, r.reasonPhrase, r.body);
}

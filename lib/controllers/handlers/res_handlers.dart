import 'package:http/http.dart';

class ResHandlers {
  static handleRes(Response res)  {
    switch(res.statusCode) {
      case 200:
        break;
      case 404:
        break;
    }
  }
}
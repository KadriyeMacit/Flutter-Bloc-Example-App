import 'package:http/http.dart' as http;

class HomeService {
  Future getHomeCard() async {
    var url = Uri.https('https://api.npoint.io/608074a088d16e0ec7ae');

    var response = await http.post(url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

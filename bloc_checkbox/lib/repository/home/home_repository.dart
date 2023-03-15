import 'package:bloc_example_app/repository/home/model/home_card_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<HomeCardModel?> getHomeCard() async {
    const String baseUrl = 'https://api.npoint.io/608074a088d16e0ec7ae';

    var url = Uri.parse(baseUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return homeCardModelFromJson(response.body);
    } else {
      return null;
    }
  }
}

import '../../network/api_client_endpoint.dart';
import '../../data/models/carousel.dart';
import '../../network/api_client.dart';

class UserDataRemoteSource {
  ApiClient client;

  UserDataRemoteSource() {
    client = ApiClient();
  }

  Future<Carousel> getUserData({int count = 5}) async {
    print('${ApiEndPoint.randomUserList}$count');
    Map<String, dynamic> jsonData =
        await client.get('${ApiEndPoint.randomUserList}$count');

    return Carousel.fromJson(jsonData);
  }
}

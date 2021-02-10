import '../../network/api_client_endpoint.dart';

import '../../data/models/Carousel.dart';

import '../../network/api_client.dart';

class UserDataRemoteSource {
  ApiClient client;
  UserDataRemoteSource() {
    client = ApiClient();
  }

  Future<Carousel> getUserData(int count) async {
    Map<String, dynamic> jsonData =
        await client.get('${ApiEndPoint.randomUserList}$count');
    return Carousel.fromJson(jsonData);
  }
}

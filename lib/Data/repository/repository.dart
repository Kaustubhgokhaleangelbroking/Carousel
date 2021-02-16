import 'package:Carousel/data/data%20source/user_data_remote_source.dart';
import '../../data/models/carousel.dart';
import '../../domain/repository/repository.dart';

class CarouselRepositoryImpl extends CarouselRepository {
  UserDataRemoteSource userDataSource;

  CarouselRepositoryImpl() {
    this.userDataSource = UserDataRemoteSource();
  }
  Future<Carousel> getUserData() => this.userDataSource.getUserData();
}

//const baseUrl = 'https://randomuser.me/api/0.4/?randomapi';
/*
const baseUrl = 'https://randomuser.me/api/0.4';
final nextUrl = (next) => '$baseUrl/?randomapi';

class CarouselRepository extends CarouselRepositoryAbstract {
  Future<Carousel> getUserData() async {
    final response =
        await http.get(baseUrl + '/?randomapi'); //datasource.getuserData()
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      return Carousel.fromJson(user);
    } else {
      throw Exception('Error');
    }
  } //datasource,,usecase to repo
}
*/

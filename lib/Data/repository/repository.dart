import '../../data/models/results.dart';
import '../../data/data%20source/user_local_data_source.dart';
import '../../data/data%20source/user_data_remote_source.dart';
import '../../data/models/carousel.dart';
import '../../domain/repository/repository.dart';

class CarouselRepositoryImpl extends CarouselRepository {
  UserDataRemoteSource userDataSource;
  UserLocalDataSource userLocalDataSource;

  CarouselRepositoryImpl() {
    this.userDataSource = UserDataRemoteSource();
    this.userLocalDataSource = UserLocalDataSource();
  }
  Future<Carousel> getUserData({bool fromLocal = false}) {
    if (fromLocal) {
      return this.userLocalDataSource.getUserData();
    }
    return this.userDataSource.getUserData();
  }

  @override
  Future<Carousel> getUser(String id, {bool fromLocal}) {
    if (!fromLocal) {
      return throw UnimplementedError();
    }
    return this.userLocalDataSource.getUserDataById(id);
  }

  @override
  Future<bool> removeUser(String id) {
    return this.userLocalDataSource.removeUserById(id);
  }

  @override
  Future<bool> saveUser(Results results) {
    return this.userLocalDataSource.saveUser(results);
  }
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

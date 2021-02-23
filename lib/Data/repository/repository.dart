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

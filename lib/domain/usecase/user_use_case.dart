import 'package:_carousel/data/models/results.dart';

import '../../data/models/carousel.dart';
import '../../data/repository/repository.dart';
import '../../domain/repository/repository.dart';

class UserUseCase {
  CarouselRepository _carouselRepositoryAbstract;

  UserUseCase() {
    this._carouselRepositoryAbstract = CarouselRepositoryImpl();
  }

  Future<Carousel> getUserData({bool fromLocal = false}) =>
      _carouselRepositoryAbstract.getUserData(fromLocal: fromLocal);

  Future<bool> saveUser(Results results) =>
      _carouselRepositoryAbstract.saveUser(results);

  Future<bool> removeUser(String id) =>
      _carouselRepositoryAbstract.removeUser(id);
}

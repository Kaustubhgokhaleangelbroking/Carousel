import 'package:Carousel/Data/models/carousel.dart';

import '../../data/repository/repository.dart';

import '../../domain/repository/repository.dart';

class UserUseCase {
  CarouselRepositoryAbstract _carouselRepositoryAbstract;

  UserUseCase() {
    this._carouselRepositoryAbstract = CarouselRepository();
  }

  Future<Carousel> getUserData() => _carouselRepositoryAbstract.getUserData();
}

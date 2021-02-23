import '../../data/models/carousel.dart';
import '../../data/repository/repository.dart';
import '../../domain/repository/repository.dart';

class UserUseCase {
  CarouselRepository _carouselRepositoryAbstract;

  UserUseCase() {
    this._carouselRepositoryAbstract = CarouselRepositoryImpl();
  }

  Future<Carousel> getUserData() => _carouselRepositoryAbstract.getUserData();
}

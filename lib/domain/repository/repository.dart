import '../../Data/models/carousel.dart';

abstract class CarouselRepositoryAbstract {
  Future<Carousel> getUserData();
}

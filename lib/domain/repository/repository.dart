import '../../data/models/carousel.dart';

abstract class CarouselRepository {
  Future<Carousel> getUserData();
}

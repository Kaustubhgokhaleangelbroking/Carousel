import '../../data/models/results.dart';
import '../../data/models/carousel.dart';

abstract class CarouselRepository {
  Future<Carousel> getUserData({bool fromLocal});

  Future<bool> saveUser(Results results);

  Future<Carousel> getUser(String id, {bool fromLocal});

  Future<bool> removeUser(String id);
}

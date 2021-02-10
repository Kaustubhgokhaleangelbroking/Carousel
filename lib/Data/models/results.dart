import 'package:Carousel/data/models/user.dart';

class Results {
  User user;
  String seed;
  String version;

  Results({this.user, this.seed, this.version});

  Results.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    seed = json['seed'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['seed'] = this.seed;
    data['version'] = this.version;
    return data;
  }
}

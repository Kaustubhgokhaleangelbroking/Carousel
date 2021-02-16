import './coordinates.dart';
import './street.dart';
import './timezone.dart';

class Location {
  Street street;
  String city;
  String state;
  String country;
  // int postcode;
  Coordinates coordinates;
  Timezone timezone;

  Location(
      {this.street,
      this.city,
      this.state,
      this.country,
      // this.postcode,
      this.coordinates,
      this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street = json['street'] != null ? Street.fromJson(json['street']) : null;
    city = json['city'];
    state = json['state'];
    country = json['country'];
    // postcode = json['postcode'] ?? 0;
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
    timezone =
        json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.street != null) {
      data['street'] = this.street.toJson();
    }
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    // data['postcode'] = this.postcode;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    if (this.timezone != null) {
      data['timezone'] = this.timezone.toJson();
    }
    return data;
  }
}

// class Location {
//   // String street;//class Street 2 prop number,name
//   String city;
//   String state;
//   //String zip; post code

//   Location({/*this.street*/ this.city, this.state});

//   Location.fromJson(Map<String, dynamic> json) {
//     // street = json['street'];
//     city = json['city'];
//     state = json['state'];
//     // zip = json['zip'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     // data['street'] = this.street;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     // data['zip'] = this.zip;
//     return data;
//   }
// }

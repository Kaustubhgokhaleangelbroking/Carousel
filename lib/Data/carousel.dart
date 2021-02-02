// class Carousel {
//   List<Results> results;

//   Carousel({this.results});

//   Carousel.fromJson(Map<String, dynamic> json) {
//     if (json['results'] != null) {
//       results = new List<Results>();
//       json['results'].forEach((v) {
//         results.add(new Results.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.results != null) {
//       data['results'] = this.results.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Results {
//   User user;
//   String seed;
//   String version;

//   Results({this.user, this.seed, this.version});

//   Results.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     seed = json['seed'];
//     version = json['version'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user.toJson();
//     }
//     data['seed'] = this.seed;
//     data['version'] = this.version;
//     return data;
//   }
// }

// class User {
//   String gender;
//   Name name;
//   Location location;
//   String email;
//   String username;
//   String password;
//   String salt;
//   String md5;
//   String sha1;
//   String sha256;
//   String registered;
//   String dob;
//   String phone;
//   String cell;
//   String sSN;
//   String picture;

//   User(
//       {this.gender,
//       this.name,
//       this.location,
//       this.email,
//       this.username,
//       this.password,
//       this.salt,
//       this.md5,
//       this.sha1,
//       this.sha256,
//       this.registered,
//       this.dob,
//       this.phone,
//       this.cell,
//       this.sSN,
//       this.picture});

//   User.fromJson(Map<String, dynamic> json) {
//     gender = json['gender'];
//     name = json['name'] != null ? new Name.fromJson(json['name']) : null;
//     location = json['location'] != null
//         ? new Location.fromJson(json['location'])
//         : null;
//     email = json['email'];
//     username = json['username'];
//     password = json['password'];
//     salt = json['salt'];
//     md5 = json['md5'];
//     sha1 = json['sha1'];
//     sha256 = json['sha256'];
//     registered = json['registered'];
//     dob = json['dob'];
//     phone = json['phone'];
//     cell = json['cell'];
//     sSN = json['SSN'];
//     picture = json['picture'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['gender'] = this.gender;
//     if (this.name != null) {
//       data['name'] = this.name.toJson();
//     }
//     if (this.location != null) {
//       data['location'] = this.location.toJson();
//     }
//     data['email'] = this.email;
//     data['username'] = this.username;
//     data['password'] = this.password;
//     data['salt'] = this.salt;
//     data['md5'] = this.md5;
//     data['sha1'] = this.sha1;
//     data['sha256'] = this.sha256;
//     data['registered'] = this.registered;
//     data['dob'] = this.dob;
//     data['phone'] = this.phone;
//     data['cell'] = this.cell;
//     data['SSN'] = this.sSN;
//     data['picture'] = this.picture;
//     return data;
//   }
// }

// class Name {
//   String title;
//   String first;
//   String last;

//   Name({this.title, this.first, this.last});

//   Name.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     first = json['first'];
//     last = json['last'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['first'] = this.first;
//     data['last'] = this.last;
//     return data;
//   }
// }

// class Location {
//   String street;
//   String city;
//   String state;
//   String zip;

//   Location({this.street, this.city, this.state, this.zip});

//   Location.fromJson(Map<String, dynamic> json) {
//     street = json['street'];
//     city = json['city'];
//     state = json['state'];
//     zip = json['zip'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['street'] = this.street;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['zip'] = this.zip;
//     return data;
//   }
// }

// /*
// class Carousel {
//   List<Results> results;
//   Info info;

//   Carousel({this.results, this.info});

//   Carousel.fromJson(Map<String, dynamic> json) {
//     if (json['results'] != null) {
//       results = new List<Results>();
//       json['results'].forEach((v) {
//         results.add(new Results.fromJson(v));
//       });
//     }
//     info = json['info'] != null ? new Info.fromJson(json['info']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.results != null) {
//       data['results'] = this.results.map((v) => v.toJson()).toList();
//     }
//     if (this.info != null) {
//       data['info'] = this.info.toJson();
//     }
//     return data;
//   }
// }

// class Results {
//   String gender;
//   Name name;
//   Location location;
//   String email;
//   Login login;
//   Dob dob;
//   Dob registered;
//   String phone;
//   String cell;
//   Id id;
//   Picture picture;
//   String nat;

//   Results(
//       {this.gender,
//       this.name,
//       this.location,
//       this.email,
//       this.login,
//       this.dob,
//       this.registered,
//       this.phone,
//       this.cell,
//       this.id,
//       this.picture,
//       this.nat});

//   Results.fromJson(Map<String, dynamic> json) {
//     gender = json['gender'];
//     name = json['name'] != null ? new Name.fromJson(json['name']) : null;
//     location = json['location'] != null
//         ? new Location.fromJson(json['location'])
//         : null;
//     email = json['email'];
//     login = json['login'] != null ? new Login.fromJson(json['login']) : null;
//     dob = json['dob'] != null ? new Dob.fromJson(json['dob']) : null;
//     registered = json['registered'] != null
//         ? new Dob.fromJson(json['registered'])
//         : null;
//     phone = json['phone'];
//     cell = json['cell'];
//     id = json['id'] != null ? new Id.fromJson(json['id']) : null;
//     picture =
//         json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
//     nat = json['nat'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['gender'] = this.gender;
//     if (this.name != null) {
//       data['name'] = this.name.toJson();
//     }
//     if (this.location != null) {
//       data['location'] = this.location.toJson();
//     }
//     data['email'] = this.email;
//     if (this.login != null) {
//       data['login'] = this.login.toJson();
//     }
//     if (this.dob != null) {
//       data['dob'] = this.dob.toJson();
//     }
//     if (this.registered != null) {
//       data['registered'] = this.registered.toJson();
//     }
//     data['phone'] = this.phone;
//     data['cell'] = this.cell;
//     if (this.id != null) {
//       data['id'] = this.id.toJson();
//     }
//     if (this.picture != null) {
//       data['picture'] = this.picture.toJson();
//     }
//     data['nat'] = this.nat;
//     return data;
//   }
// }

// class Name {
//   String title;
//   String first;
//   String last;

//   Name({this.title, this.first, this.last});

//   Name.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     first = json['first'];
//     last = json['last'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['first'] = this.first;
//     data['last'] = this.last;
//     return data;
//   }
// }

// class Location {
//   Street street;
//   String city;
//   String state;
//   String country;
//   int postcode;
//   Coordinates coordinates;
//   Timezone timezone;

//   Location(
//       {this.street,
//       this.city,
//       this.state,
//       this.country,
//       this.postcode,
//       this.coordinates,
//       this.timezone});

//   Location.fromJson(Map<String, dynamic> json) {
//     street =
//         json['street'] != null ? new Street.fromJson(json['street']) : null;
//     city = json['city'];
//     state = json['state'];
//     country = json['country'];
//     postcode = json['postcode'];
//     coordinates = json['coordinates'] != null
//         ? new Coordinates.fromJson(json['coordinates'])
//         : null;
//     timezone = json['timezone'] != null
//         ? new Timezone.fromJson(json['timezone'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.street != null) {
//       data['street'] = this.street.toJson();
//     }
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     data['postcode'] = this.postcode;
//     if (this.coordinates != null) {
//       data['coordinates'] = this.coordinates.toJson();
//     }
//     if (this.timezone != null) {
//       data['timezone'] = this.timezone.toJson();
//     }
//     return data;
//   }
// }

// class Street {
//   int number;
//   String name;

//   Street({this.number, this.name});

//   Street.fromJson(Map<String, dynamic> json) {
//     number = json['number'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['number'] = this.number;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Coordinates {
//   String latitude;
//   String longitude;

//   Coordinates({this.latitude, this.longitude});

//   Coordinates.fromJson(Map<String, dynamic> json) {
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     return data;
//   }
// }

// class Timezone {
//   String offset;
//   String description;

//   Timezone({this.offset, this.description});

//   Timezone.fromJson(Map<String, dynamic> json) {
//     offset = json['offset'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['offset'] = this.offset;
//     data['description'] = this.description;
//     return data;
//   }
// }

// class Login {
//   String uuid;
//   String username;
//   String password;
//   String salt;
//   String md5;
//   String sha1;
//   String sha256;

//   Login(
//       {this.uuid,
//       this.username,
//       this.password,
//       this.salt,
//       this.md5,
//       this.sha1,
//       this.sha256});

//   Login.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     username = json['username'];
//     password = json['password'];
//     salt = json['salt'];
//     md5 = json['md5'];
//     sha1 = json['sha1'];
//     sha256 = json['sha256'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['uuid'] = this.uuid;
//     data['username'] = this.username;
//     data['password'] = this.password;
//     data['salt'] = this.salt;
//     data['md5'] = this.md5;
//     data['sha1'] = this.sha1;
//     data['sha256'] = this.sha256;
//     return data;
//   }
// }

// class Dob {
//   String date;
//   int age;

//   Dob({this.date, this.age});

//   Dob.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     age = json['age'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['date'] = this.date;
//     data['age'] = this.age;
//     return data;
//   }
// }

// class Id {
//   String name;
//   Null value;

//   Id({this.name, this.value});

//   Id.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     value = json['value'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['value'] = this.value;
//     return data;
//   }
// }

// class Picture {
//   String large;
//   String medium;
//   String thumbnail;

//   Picture({this.large, this.medium, this.thumbnail});

//   Picture.fromJson(Map<String, dynamic> json) {
//     large = json['large'];
//     medium = json['medium'];
//     thumbnail = json['thumbnail'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['large'] = this.large;
//     data['medium'] = this.medium;
//     data['thumbnail'] = this.thumbnail;
//     return data;
//   }
// }

// class Info {
//   String seed;
//   int results;
//   int page;
//   String version;

//   Info({this.seed, this.results, this.page, this.version});

//   Info.fromJson(Map<String, dynamic> json) {
//     seed = json['seed'];
//     results = json['results'];
//     page = json['page'];
//     version = json['version'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['seed'] = this.seed;
//     data['results'] = this.results;
//     data['page'] = this.page;
//     data['version'] = this.version;
//     return data;
//   }
// }
// */

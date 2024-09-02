class User {
  final String? firstName;
  final String? lastName;
  final String? username;
  late final String? email;
  final String? address;
  late final String? password;
  final String? phone;
  final String? gender;
  final DateTime? dob;
  final String? photo;
  final int? id;

  User({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.address,
    this.password,
    this.phone,
    this.gender,
    this.dob,
    this.photo,
    this.id,
  });

  get name {
    return ("$firstName ${lastName!}");
  }

  get age {
    final now = DateTime.now();
    final ageInMilliseconds = now.difference(dob!).inMilliseconds;
    final millisecondsInYear = (365.25 * 24 * 60 * 60 * 1000).round();
    return (ageInMilliseconds / millisecondsInYear).floor();
  }

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        username = json['username'] as String?,
        email = json['email'] as String?,
        address = json['address'] as String?,
        password = json['password'] as String?,
        phone = json['phone'] as String?,
        gender = json['gender'] as String?,
        dob = DateTime.parse(json['dob']),
        photo = json['photo'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': email,
        'address': address,
        'password': password,
        'phone': phone,
        'gender': gender,
        'dob': dob?.toIso8601String(),
        'photo': photo,
        'id': id
      };
}

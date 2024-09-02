class Vendor {
  int id;
  String name;
  String email;
  String address;
  String phone;
  String photo;

  Vendor(
      {this.id = 0, this.name = '', this.email = '', this.address = '', this.phone = '', this.photo = ''});

  factory Vendor.fromJson(data) {
    return Vendor(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      address: data['address'],
      phone: data['phone'],
      photo: data['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['phone'] = phone;
    data['photo'] = photo;
    return data;
  }
}


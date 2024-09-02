class DonationGoup {
  final int? id;
  final String? totalAmount;
  final DateTime? date;
  final int? vendorId;
  final String? mode;
  final Donor? donor;
  final List<Donations>? donations;
  final List<String>? donationsDescription;

  DonationGoup({
    this.id,
    this.totalAmount,
    this.date,
    this.vendorId,
    this.mode,
    this.donor,
    this.donations,
    this.donationsDescription,
  });

  DonationGoup.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      totalAmount = json['total_amount'] as String?,
      date = DateTime.parse(json['date']),
      vendorId = json['vendor_id'] as int?,
      mode = json['mode'] as String?,
      donor = (json['donor'] as Map<String,dynamic>?) != null ? Donor.fromJson(json['donor'] as Map<String,dynamic>) : null,
      donations = (json['donations'] as List?)?.map((dynamic e) => Donations.fromJson(e as Map<String,dynamic>)).toList(),
      donationsDescription = (json['donations_description'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'total_amount' : totalAmount,
     'date' : date?.toIso8601String(),
    'vendor_id' : vendorId,
    'mode' : mode,
    'donor' : donor?.toJson(),
    'donations' : donations?.map((e) => e.toJson()).toList(),
    'donations_description' : donationsDescription
  };
}

class Donor {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? phone;
  final String? photo;

  Donor({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.photo,
  });

  Donor.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      email = json['email'] as String?,
      address = json['address'] as String?,
      phone = json['phone'] as String?,
      photo = json['photo'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'address' : address,
    'phone' : phone,
    'photo' : photo
  };
}

class Donations {
  final int? id;
  final int? itemId;
  final String? price;
  final String? quantity;
  final int? groupId;
  final dynamic itemOutId;
  final String? mode;
  final DateTime? date;
  final String? remark;

  Donations({
    this.id,
    this.itemId,
    this.price,
    this.quantity,
    this.groupId,
    this.itemOutId,
    this.mode,
    this.date,
    this.remark,
  });

  Donations.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      itemId = json['item_id'] as int?,
      price = json['price'] as String?,
      quantity = json['quantity'] as String?,
      groupId = json['group_id'] as int?,
      itemOutId = json['item_out_id'],
      mode = json['mode'] as String?,
      date = DateTime.parse(json['date']),
      remark = json['remark'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'item_id' : itemId,
    'price' : price,
    'quantity' : quantity,
    'group_id' : groupId,
    'item_out_id' : itemOutId,
    'mode' : mode,
     'date' : date?.toIso8601String(),
    'remark' : remark
  };
}
class ConsumptionGoup {
  final int? id;
  final String? totalAmount;
  final int? buyerId;
  final String? mode;
  final DateTime? date;
  final Consumer? consumer;
  final List<Consumptions>? consumptions;
  final List<String>? consumptionsDescription;

  ConsumptionGoup({
    this.id,
    this.totalAmount,
    this.buyerId,
    this.mode,
    this.date,
    this.consumer,
    this.consumptions,
    this.consumptionsDescription,
  });

  ConsumptionGoup.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        totalAmount = json['total_amount'] as String?,
        buyerId = json['buyer_id'] as int?,
        mode = json['mode'] as String?,
        date = DateTime.parse(json['date']),
        consumer = (json['consumer'] as Map<String, dynamic>?) != null
            ? Consumer.fromJson(json['consumer'] as Map<String, dynamic>)
            : null,
        consumptions = (json['consumptions'] as List?)
            ?.map(
                (dynamic e) => Consumptions.fromJson(e as Map<String, dynamic>))
            .toList(),
        consumptionsDescription = (json['consumptions_description'] as List?)
            ?.map((dynamic e) => e as String)
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'total_amount': totalAmount,
        'buyer_id': buyerId,
        'mode': mode,
        'date': date?.toIso8601String(),
        'consumer': consumer?.toJson(),
        'consumptions': consumptions?.map((e) => e.toJson()).toList(),
        'consumptions_description': consumptionsDescription
      };
}

class Consumer {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? address;
  final String? password;
  final String? phone;
  final String? gender;
  final DateTime? dob;
  final String? photo;

  Consumer({
    this.id,
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
  });

  get name {
    return ("$firstName ${lastName!}");
  }

  Consumer.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        username = json['username'] as String?,
        email = json['email'] as String?,
        address = json['address'] as String?,
        password = json['password'] as String?,
        phone = json['phone'] as String?,
        gender = json['gender'] as String?,
        dob = DateTime.parse(json['dob']),
        photo = json['photo'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': email,
        'address': address,
        'password': password,
        'phone': phone,
        'gender': gender,
        'dob': dob?.toIso8601String(),
        'photo': photo
      };
}

class Consumptions {
  final int? id;
  final String? mode;
  final int? itemId;
  final int? groupId;
  final String? quantity;
  final String? sellingPrice;
  final DateTime? date;
  final String? remark;

  Consumptions({
    this.id,
    this.mode,
    this.itemId,
    this.groupId,
    this.quantity,
    this.sellingPrice,
    this.date,
    this.remark,
  });

  Consumptions.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        mode = json['mode'] as String?,
        itemId = json['item_id'] as int?,
        groupId = json['group_id'] as int?,
        quantity = json['quantity'] as String?,
        sellingPrice = json['selling_price'] as String?,
        date = DateTime.parse(json['date']),
        remark = json['remark'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'mode': mode,
        'item_id': itemId,
        'group_id': groupId,
        'quantity': quantity,
        'selling_price': sellingPrice,
        'date': date?.toIso8601String(),
        'remark': remark
      };
}

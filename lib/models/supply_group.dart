class SupplyGoup {
  final int? id;
  final String? totalAmount;
  final DateTime? date;
  final int? vendorId;
  final String? mode;
  final Seller? seller;
  final List<Supplies>? supplies;
  final List<String>? suppliesDescription;

  SupplyGoup({
    this.id,
    this.totalAmount,
    this.date,
    this.vendorId,
    this.mode,
    this.seller,
    this.supplies,
    this.suppliesDescription,
  });

  SupplyGoup.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        totalAmount = json['total_amount'] as String?,
        date = DateTime.parse(json['date']),
        vendorId = json['vendor_id'] as int?,
        mode = json['mode'] as String?,
        seller = (json['seller'] as Map<String, dynamic>?) != null
            ? Seller.fromJson(json['seller'] as Map<String, dynamic>)
            : null,
        supplies = (json['supplies'] as List?)
            ?.map((dynamic e) => Supplies.fromJson(e as Map<String, dynamic>))
            .toList(),
        suppliesDescription = (json['supplies_description'] as List?)
            ?.map((dynamic e) => e as String)
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'total_amount': totalAmount,
        'date': date?.toIso8601String(),
        'vendor_id': vendorId,
        'mode': mode,
        'seller': seller?.toJson(),
        'supplies': supplies?.map((e) => e.toJson()).toList(),
        'supplies_description': suppliesDescription
      };
}

class Seller {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? phone;
  final String? photo;

  Seller({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.photo,
  });


  Seller.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        address = json['address'] as String?,
        phone = json['phone'] as String?,
        photo = json['photo'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'address': address,
        'phone': phone,
        'photo': photo
      };
}

class Supplies {
  final int? id;
  final int? itemId;
  final String? price;
  final String? quantity;
  final int? groupId;
  final dynamic itemOutId;
  final String? mode;
  final DateTime? date;
  final String? remark;

  Supplies({
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

  Supplies.fromJson(Map<String, dynamic> json)
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
        'id': id,
        'item_id': itemId,
        'price': price,
        'quantity': quantity,
        'group_id': groupId,
        'item_out_id': itemOutId,
        'mode': mode,
        'date': date?.toIso8601String(),
        'remark': remark
      };
}

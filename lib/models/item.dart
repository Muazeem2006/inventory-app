class Item {
  final int? id;
  final String? name;
  final String? description;
  final String? model;
  final String? brand;
  final String? manufacturer;
  final String? usageMode;
  final String? costPrice;
  final int? usefulLife;
  final DateTime? manufactureDate;
  final DateTime? procurementDate;
  final String? serialNumber;
  final String? type;
  final String? sellingPrice;
  final String? photo;
  final dynamic totalSupply;
  final String? totalSold;
  final int? stockLeft;

  Item({
    this.id,
    this.name,
    this.description,
    this.model,
    this.brand,
    this.manufacturer,
    this.usageMode,
    this.costPrice,
    this.usefulLife,
    this.manufactureDate,
    this.procurementDate,
    this.serialNumber,
    this.type,
    this.sellingPrice,
    this.photo,
    this.totalSupply,
    this.totalSold,
    this.stockLeft,
  });

  Item.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      description = json['description'] as String?,
      model = json['model'] as String?,
      brand = json['brand'] as String?,
      manufacturer = json['manufacturer'] as String?,
      usageMode = json['usage_mode'] as String?,
      costPrice = json['cost_price'] as String?,
      usefulLife = json['useful_life'] as int?,
      manufactureDate = DateTime.parse(json['manufacture_date']),
      procurementDate = DateTime.parse(json['procurement_date']),
      serialNumber = json['serial_number'] as String?,
      type = json['type'] as String?,
      sellingPrice = json['selling_price'] as String?,
      photo = json['photo'] as String?,
      totalSupply = json['totalSupply'],
      totalSold = json['totalSold'] as String?,
      stockLeft = json['stockLeft'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'description' : description,
    'model' : model,
    'brand' : brand,
    'manufacturer' : manufacturer,
    'usage_mode' : usageMode,
    'cost_price' : costPrice,
    'useful_life' : usefulLife,
    'manufacture_date' : manufactureDate?.toIso8601String(),
    'procurement_date' : procurementDate?.toIso8601String(),
    'serial_number' : serialNumber,
    'type' : type,
    'selling_price' : sellingPrice,
    'photo' : photo,
    'totalSupply' : totalSupply,
    'totalSold' : totalSold,
    'stockLeft' : stockLeft
  };
}
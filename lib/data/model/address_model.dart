class AddressModel {
  final int id;
  final String title;
  final String fullAddress;
  final num lat;
  final num lng;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.title,
    required this.fullAddress,
    required this.lat,
    required this.lng,
    required this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      title: json['title']??"",
      fullAddress: json['fullAddress']??"",
      lat: json['lat']??0,
      lng: json['lng']??0,
      isDefault: json['isDefault'] ?? true,
    );
    
  }
}

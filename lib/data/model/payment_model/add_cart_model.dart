class AddCardModel {
  final String cardNumber;
  final String expiryDate;
  final String securityCode;

  const AddCardModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });

  factory AddCardModel.toJson(Map<String, dynamic> json) {
    return AddCardModel(
      cardNumber: json['cardNumber'] ?? '',
      expiryDate: json['expiryDate'] ?? '',
      securityCode: json['securityCode'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
    'cardNumber': cardNumber,
    'expiryDate': expiryDate,
    'securityCode': securityCode,
  };
}

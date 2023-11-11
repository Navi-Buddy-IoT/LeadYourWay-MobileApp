class Card {
  final int id;
  final String cardNumber;
  final String cardType;
  final String cardCvv;
  final String cardExpirationDate;
  final double cardAmount;
  final String cardHolder;
  final bool cardMain;

  Card({
    required this.id,
    required this.cardNumber,
    required this.cardType,
    required this.cardCvv,
    required this.cardExpirationDate,
    required this.cardAmount,
    required this.cardHolder,
    required this.cardMain,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json['id'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        cardCvv: json['cardCvv'],
        cardExpirationDate: json['cardExpirationDate'],
        cardAmount: json['cardAmount'],
        cardHolder: json['cardHolder'],
        cardMain: json['cardMain'],
      );

  factory Card.fromMap(Map<String, dynamic> map) => Card(
        id: map['id'],
        cardNumber: map['cardNumber'],
        cardType: map['cardType'],
        cardCvv: map['cardCvv'],
        cardExpirationDate: map['cardExpirationDate'],
        cardAmount: map['cardAmount'],
        cardHolder: map['cardHolder'],
        cardMain: map['cardMain'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'cardNumber': cardNumber,
        'cardType': cardType,
        'cardCvv': cardCvv,
        'cardExpirationDate': cardExpirationDate,
        'cardAmount': cardAmount,
        'cardHolder': cardHolder,
        'cardMain': cardMain,
      };
}

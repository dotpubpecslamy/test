import 'dart:convert';

class User {
  int id;
  String name;
  String email;
  String brandName;
  String rewardPoints;
  String balance;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.brandName,
    required this.rewardPoints,
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'brandName': brandName,
      'rewardPoints': rewardPoints,
      'balance': balance,
    };
  }
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      brandName: map['brandName'],
      rewardPoints: map['rewardPoints'],
      balance: map['balance'],
    );
  }

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
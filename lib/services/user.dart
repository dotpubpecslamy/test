import '../model/user.dart';

class UserService {
  late User user;

  Future<User> getUser(){
    Map<String, dynamic> userData = {
      'id': 1,
      'name': 'Juan Dela Cruz',
      'email': 'brand@email.com',
      'brandName': 'BRAND',
      'rewardPoints': '20000',
      'balance': '99000',
    };
    
    return Future.delayed(const Duration(seconds: 3), () {
      user = User.fromMap(userData);
      return User.fromMap(userData);
    });
  }
}
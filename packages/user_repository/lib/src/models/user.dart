import 'package:pizza_app_learning/src/entities/user_entity.dart';

class MyUser {
  String userId;
  String name;
  String email;
  bool hasActiveCart;

  MyUser({
    required this.userId,
    required this.name,
    required this.email,
    required this.hasActiveCart,
  });

  static final empty = MyUser(
    userId: '',
    name: '',
    email: '',
    hasActiveCart: false,
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      name: name,
      email: email,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      hasActiveCart: entity.hasActiveCart,
    );
  }

  @override
  String toString() {
    return "MyUser: $userId $email, $name, $hasActiveCart";
  }
}

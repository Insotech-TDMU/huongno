import 'dart:convert';

class User{
  int? id;
  String? username;
  String? password;
  String? token;

  User({
    this.id,
    this.username,
    this.password,
     this.token,
});
  User copyWith({
  int? id,
  String? username,
    String? password,
}) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,

    );
  }

  Map<String , dynamic> toMap(){
    return{
      'id':id,
      'username':username,
      'password':password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.password == password &&
        other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    username.hashCode ^
    password.hashCode;
  }

}
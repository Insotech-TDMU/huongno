import 'dart:convert';

class Customer{
  int? id;
  String? name;
  String? phone;
  String? sex;
  String? birthday;
  Customer({
    this.id,
    this.name,
    this.phone,
    this.sex,
    this.birthday
  });

  Customer copyWith({
    int? id,
    String? name,
    String? phone,
    String? sex,
    String? birthday
  }){
    return Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        sex: sex ?? this.sex,
        birthday: birthday ?? this.birthday
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'phone':phone,
      'sex':sex,
      'birthday':birthday
    };
  }


  factory Customer.fromMap(Map<String, dynamic> map){
    return Customer(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        phone: map['phone'] ?? '',
        sex: map['sex'] ?? '',
        birthday: map['birthday'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));



  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.sex == sex &&
        other.birthday == birthday;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    phone.hashCode ^
    sex.hashCode ^
    birthday.hashCode;
  }

}
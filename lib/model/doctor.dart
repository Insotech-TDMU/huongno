import 'dart:convert';

class Doctor{
  int? id;
  String? name;
  String? sex;
  String? birthday;
  String? description;
  Doctor({
    this.id,
    this.name,
    this.sex,
    this.birthday,
    this.description
  });

  Doctor copyWith({
    int? id,
    String? name,
    String? sex,
    String? birthday,
    String? description,
  }){
    return Doctor(
        id: id ?? this.id,
        name: name ?? this.name,
        sex: sex ?? this.sex,
        birthday: birthday ?? this.birthday,
      description: description ?? this.description
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'sex':sex,
      'birthday':birthday,
      'description':description
    };
  }


  factory Doctor.fromMap(Map<String, dynamic> map){
    return Doctor(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        sex: map['sex'] ?? '',
        birthday: map['birthday'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));



  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Doctor &&
        other.id == id &&
        other.name == name &&
        other.sex == sex &&
        other.description == description &&
        other.birthday == birthday;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    sex.hashCode ^
    description.hashCode ^
    birthday.hashCode;
  }

}
import 'dart:convert';


class Animal {
  final int id;
  final String nameAnimal;
  final String age;
  final String weight;
  final String temperature;
  final String sexAnimal;
  final String species;
  final String datetime;
  final String vacXin;
  final int idcustomer;
  final String nameCustomer;
  Animal({
    required this.id,
    required this.nameAnimal,
    required this.age,
    required this.weight,
    required this.temperature,
    required this.sexAnimal,
    required this.species,
    required this.datetime,
    required this.vacXin,
    required this.idcustomer,
    required this.nameCustomer,
  });

  Animal copyWith({
    int? id,
    String? nameAnimal,
    String? age,
    String? weight,
    String? temperature,
    String? sexAnimal,
    String? species,
    String? datetime,
    String? vacXin,
    int? idcustomer,
    String? nameCustomer,

  }) {
    return Animal(
      id: id ?? this.id,
      nameAnimal: nameAnimal ?? this.nameAnimal,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      temperature: temperature ?? this.temperature,
      sexAnimal: sexAnimal ?? this.sexAnimal,
      species: species ?? this.species,
      datetime: datetime ?? this.datetime,
      vacXin: vacXin ?? this.vacXin,
      idcustomer: idcustomer  ?? this.idcustomer,
      nameCustomer: nameCustomer ?? this.nameCustomer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameanimal': nameAnimal,
      'age' : age,
      'weight' : weight,
      'temperature': temperature,
      'sexanimal': sexAnimal,
      'species': species,
      'datetime':datetime,
      'vacxin':vacXin,
      'id_name':idcustomer,
      'name': nameCustomer,
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'] ?? 0,
      nameAnimal: map['nameanimal'] ?? '',
      age: map['age'] ?? '',
      weight: map['weight'] ?? '',
      temperature: map['temperature'] ?? '',
      sexAnimal: map['sexanimal'] ?? '',
      species: map['species'] ?? '',
      datetime: map['datetime'] ?? '',
      vacXin: map['vacxin'] ?? '',
      idcustomer: map['id_name'] ?? 0,
      nameCustomer: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) => Animal.fromMap(json.decode(source));


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Animal &&
        other.id == id &&
        other.nameAnimal == nameAnimal &&
        other.age == age &&
        other.weight == weight &&
        other.temperature == temperature &&
        other.sexAnimal == sexAnimal &&
        other.species == species &&
        other.datetime == datetime &&
        other.vacXin == vacXin &&
        other.idcustomer == idcustomer &&
        other.nameCustomer == nameCustomer;
  }

  @override
  int get hashCode => id.hashCode ^ nameAnimal.hashCode
  ^ age.hashCode ^ weight.hashCode
  ^ temperature.hashCode ^ sexAnimal.hashCode ^ species.hashCode
  ^ datetime.hashCode ^ vacXin.hashCode ^ idcustomer.hashCode ^ nameCustomer.hashCode;
}
int? convertCustomerID(int? id) {
  return id;
}

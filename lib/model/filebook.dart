import 'dart:convert';

import 'package:huongno/model/animal.dart';
import 'package:huongno/model/bill.dart';
import 'package:huongno/model/customer.dart';
import 'package:huongno/model/doctor.dart';

class FileBook{
  int? id;
  String? datetime;
  String? clinical_symptoms;
  String? symptoms;
  String? treatment;
  String? des;
  int? id_doctor;
  int? id_customer;
  int? id_animal;
  String? note;
  String? image_1;
  String? image_2;
  String? image_3;
  String? createdAt;
  int? createdUser;
  String? updateAt;
  String? updateUser;
  final Customer? customer;
  final Animal? animal;
  final Doctor? doctor;
  final Bill? bill;

  FileBook({
    this.id,
    this.datetime,
    this.clinical_symptoms,
    this.symptoms,
    this.treatment,
    this.des,
    this.id_doctor,
    this.id_customer,
    this.id_animal,
    this.note,
    this.image_1,
    this.image_2,
    this.image_3,
    this.createdAt,
    this.createdUser,
    this.updateUser,
    this.updateAt,
    this.customer,
    this.animal,
    this.doctor,
    this.bill,
});

  FileBook copyWith({
    int? id,
    String? datetime,
    String? clinical_symptoms,
    String? symptoms,
    String? treatment,
    String? des,
    int? id_doctor,
    int? id_customer,
    int? id_animal,
    String? note,
    String? image_1,
    String? image_2,
    String? image_3,
    String? createdAt,
    int? createdUser,
    String? updateAt,
    String? updateUser,
    Customer? customer,
    Animal? animal,
    Doctor? doctor,
    Bill? bill,

}) {
    return FileBook(
      id: id ?? this.id,
      datetime: datetime ?? this.datetime,
      clinical_symptoms: clinical_symptoms ?? this.clinical_symptoms,
      symptoms: symptoms ?? this.symptoms,
      treatment: treatment ?? this.treatment,
      des: des ?? this.des,
      id_doctor: id_doctor ?? this.id_doctor,
      id_customer: id_customer ?? this.id_customer,
      id_animal: id_animal ?? this.id_animal,
      note: note ?? this.note,
      image_1: image_1 ?? this.image_1,
      image_2: image_2 ?? this.image_2,
      image_3: image_3 ?? this.image_3,
      createdAt: createdAt ?? this.createdAt,
      createdUser: createdUser ?? this.createdUser,
      updateAt: updateAt ?? this.updateAt,
      updateUser: updateUser ?? this.updateUser,
      customer: customer ?? this.customer,
      animal: animal ?? this.animal,
      doctor: doctor ?? this.doctor,
      bill: bill ?? this.bill
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'datetime':datetime,
      'clinical_symptoms':clinical_symptoms,
      'symptoms':symptoms,
      'treatment':treatment,
      'des':des,
      'id_doctor':id_doctor,
      'id_customer':id_customer,
      'id_animal':id_animal,
      'note':note,
      'image_1':image_1,
      'image_2':image_2,
      'image_3':image_3,
      'createdAt':createdAt,
      'createdUser':createdUser,
      'updateAt':updateAt,
      'updateUser':updateUser,
    };
  }

  factory FileBook.fromMap(Map<String, dynamic> map){
    return FileBook(
        id: map['id'] ?? 0,
        datetime: map['datetime'],
        clinical_symptoms: map['clinical_symptoms'],
      symptoms: map['symptoms'],
      treatment: map['treatment'],
      des: map['des'] ?? map['des'],
      id_doctor: map['id_doctor'] ?? 0,
      id_animal: map['id_animal'] ?? 0,
      id_customer: map['id_customer'] ?? 0,
      note: map['note'] ?? '',
      image_1: map['image_1'] ?? '',
      image_2: map['image_2'] ?? '',
      image_3: map['image_3'] ?? '',
      createdAt: map['createdAt'] ?? '',
      createdUser: map['createdUser'],
      updateAt: map['updateAt'] ?? '',
      updateUser: map['updateUser'] ?? '',
      customer: Customer.fromMap(map['customer'] ?? {}),
      animal: Animal.fromMap(map['animal'] ?? {}),
      doctor:Doctor.fromMap(map['doctor'] ?? {}),
      bill: Bill.fromMap(map['bill'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory FileBook.fromJson(String source) => FileBook.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FileBook &&
        other.id == id &&
        other.datetime == datetime &&
        other.clinical_symptoms == clinical_symptoms &&
        other.symptoms == symptoms &&
        other.treatment == treatment &&
        other.des == des &&
        other.id_doctor == id_doctor &&
        other.id_customer == id_customer &&
        other.id_animal == id_animal &&
        other.note == note &&
        other.image_1 == image_1 &&
        other.image_2 == image_2 &&
        other.image_3 == image_3 &&
        other.createdAt == createdAt &&
        other.createdUser == createdUser &&
        other.updateAt == updateAt &&
        other.updateUser == updateUser;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    datetime.hashCode ^
    clinical_symptoms.hashCode ^
    symptoms.hashCode ^
    treatment.hashCode ^
    des.hashCode ^
    id_doctor.hashCode ^
    id_customer.hashCode ^
    id_animal.hashCode ^
    note.hashCode ^
    image_1.hashCode ^
    image_2.hashCode ^
    image_3.hashCode ^
    createdAt.hashCode ^
    createdUser.hashCode ^
    updateAt.hashCode ^
    updateUser.hashCode;
  }

}
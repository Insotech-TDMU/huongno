import 'dart:convert';

import 'package:huongno/model/billinfo.dart';

class Bill{
  int? id;
  int? id_seller;
  int? id_customer;
  String? datetime;
  int? total;
  String? status;
  int? idi_file;
  final List<BillInfo> billinfo;
  Bill({
    this.id,
    this.id_seller,
    this.id_customer,
    this.datetime,
    this.total,
    this.status,
    this.idi_file,
    required this.billinfo
  });

  Bill copyWith({
    int? id,
    int? id_seller,
    int? id_customer,
    String? datetime,
    int? total,
    String? status,
    int? idi_file,
  }){
    return Bill(
        id: id ?? this.id,
        id_seller: id_seller ?? id_seller,
        id_customer: id_customer ?? id_customer,
        datetime: datetime ?? datetime,
        total: total ?? total,
      status: status ?? status,
      idi_file: idi_file ?? idi_file,
      billinfo: billinfo ?? billinfo,
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'id_seller':id_seller,
      'id_customer':id_customer,
      'datetime':datetime,
      'total':total,
      'status':status,
      'idi_file':idi_file,
      'billinfo':_convertBillinfo(),
    };
  }


  factory Bill.fromMap(Map<String, dynamic> map){
    return Bill(
        id: map['id'] ?? 0,
        id_seller: map['id_seller'] ?? '',
        id_customer: map['id_customer'] ?? '',
        datetime: map['datetime'] ?? '',
        total: map['total'] ?? '',
      status: map['status'] ?? '',
      idi_file: map['idi_file'] ?? '',
      billinfo: map['billinfo'] != null ? List<BillInfo>.from(map['billinfo'].map((x) => BillInfo.fromMap(x))) : [],

    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source));


  List<Map<String, dynamic>> _convertBillinfo() {
    List<Map<String, dynamic>> res = [];

    for (var element in billinfo!) {
      res.add(element.toMap());
    }

    return res;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bill  &&
        other.id == id &&
        other.id_seller == id_seller &&
        other.id_customer == id_customer &&
        other.datetime == datetime &&
        other.total == total &&
        other.status == status &&
        other.idi_file == idi_file ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    id_seller.hashCode ^
    id_customer.hashCode ^
    datetime.hashCode ^
    total.hashCode ^
    status.hashCode ^
    idi_file.hashCode;
  }

}
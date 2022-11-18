import 'dart:convert';

class BillInfo{
  int? id;
  int? id_product;
  int? quantity;
  int? price;
  int? id_bill;
  String? productname;
  BillInfo({
    this.id,
    this.id_product,
    this.quantity,
    this.price,
    this.id_bill,
    this.productname
  });

  BillInfo copyWith({
    int? id,
    int? id_product,
    int? quantity,
    int? price,
    int? id_bill,
    String? productname,
  }){
    return BillInfo(
        id: id ?? this.id,
        id_product: id_product ?? this.id_product,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        id_bill: id_bill ?? this.id_bill,
      productname: productname ?? this.productname
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'id_product':id_product,
      'quantity':quantity,
      'price':price,
      'id_bill':id_bill,
      'productname':productname
    };
  }


  factory BillInfo.fromMap(Map<String, dynamic> map){
    return BillInfo(
        id: map['id'] ?? 0,
        id_product: map['id_product'] ?? '',
        quantity: map['quantity'] ?? '',
        price: map['price'] ?? '',
        id_bill: map['id_bill'] ?? '',
      productname: map['productname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BillInfo.fromJson(String source) => BillInfo.fromMap(json.decode(source));



  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillInfo &&
        other.id == id &&
        other.id_product == id_product &&
        other.quantity == quantity &&
        other.price == price &&
        other.id_bill == id_bill &&
        other.productname == productname;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    id_product.hashCode ^
    quantity.hashCode ^
    price.hashCode ^
    id_bill.hashCode ^
    productname.hashCode;
  }

}
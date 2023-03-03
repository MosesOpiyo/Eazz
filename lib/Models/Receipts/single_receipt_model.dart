// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class SingleReceiptResponseModel {
  String? server;
  int? customerId;
  String? customerName;
  List<Items>? items;

  SingleReceiptResponseModel(
      {this.server, this.customerId, this.customerName, this.items});

  SingleReceiptResponseModel.fromJson(Map<String, dynamic> json) {
    server = json['server'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['server'] = this.server;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  int? quantity;
  int? amount;

  Items({this.name, this.quantity, this.amount});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    return data;
  }
}

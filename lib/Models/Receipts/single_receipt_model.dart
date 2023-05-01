// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class SingleReceiptResponseModel {
  String? receiptNumber;
  String? storeName;
  String? serverName;
  int? receiptTotal;
  List<Items>? items;

  SingleReceiptResponseModel(
      {this.receiptNumber,
      this.storeName,
      this.serverName,
      this.receiptTotal,
      this.items});

  SingleReceiptResponseModel.fromJson(Map<String, dynamic> json) {
    receiptNumber = json['receipt_number'];
    storeName = json['store_name'];
    serverName = json['server_name'];
    receiptTotal = json['total'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receipt_number'] = this.receiptNumber;
    data['store_name'] = this.storeName;
    data['server_name'] = this.serverName;
    data['total'] = this.receiptTotal;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  int? itemNumber;
  int? price;

  Items({this.name, this.itemNumber, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    itemNumber = json['item_number'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['item_number'] = this.itemNumber;
    data['price'] = this.price;
    return data;
  }
}

// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class StatementsResponseModel {
  String? receiptNumber;
  String? storeName;
  String? serverName;
  int? receiptTotal;

  StatementsResponseModel({
    this.receiptNumber,
    this.storeName,
    this.serverName,
    this.receiptTotal,
  });

  StatementsResponseModel.fromJson(Map<String, dynamic> json) {
    receiptNumber = json['receipt']['receipt_number'];
    storeName = json['receipt']['store_name'];
    serverName = json['receipt']['server_name'];
    receiptTotal = json['receipt']['total'];
  }
}

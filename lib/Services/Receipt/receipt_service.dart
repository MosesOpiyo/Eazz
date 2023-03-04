// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:eazz/Models/Receipts/receipt_models.dart';
import 'package:eazz/Models/Receipts/single_receipt_model.dart';
import 'package:http/http.dart' as http;
import 'package:eazz/Constants/constants.dart';
import 'dart:convert' as cnv;
import 'package:shared_preferences/shared_preferences.dart';

class ReceiptService {
  var client = http.Client();
  Future postReceipt(result) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.receipt);

    var response = await http.post(
      url,
      headers: requestHeaders,
      body: result,
    );
    return cnv.jsonDecode(response.body);
  }

  Future<List<ReceiptResponseModel>> getReceipts() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {'Authorization': 'Token $token'};
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.receipt);

    var response = await http.get(
      url,
      headers: requestHeaders,
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    var receipt = body
        .map((dynamic item) => ReceiptResponseModel.fromJson(item))
        .toList();

    return receipt;
  }

  Future<SingleReceiptResponseModel> getReceipt(number) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {'Authorization': 'Token $token'};
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.singleReceipt + '/$number');

    var response = await http.get(
      url,
      headers: requestHeaders,
    );
    return SingleReceiptResponseModel.fromJson(cnv.jsonDecode(response.body));
  }
}
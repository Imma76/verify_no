import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCall {
  bool check = false;
  getData({required String code, required String no}) async {
    var link = Uri.parse(
        'https://api.veriphone.io/v2/verify?phone=%2B$code-$no&key=4B1B5254BF1640E39E76AC5158A99001');
    var data = await http.get(link);
    if (data.statusCode == 200) {
      final decodedData = jsonDecode(data.body);

      final jsonData =
          Data.fromJson(data: decodedData, statusCode: data.statusCode);
      print(jsonData.career);
      return jsonData;
    } else {
      final decodedData = jsonDecode(data.body);
      final jsonData =
          Data.fromJson(data: decodedData, statusCode: data.statusCode);

      return jsonData;
    }

    // } else {
    //   var link = Uri.parse(
    //       'https://api.veriphone.io/v2/verify?phone=%2B234-8161759386&key=4B1B5254BF1640E39E76AC5158A99001');
    //   var data = await http.get(link);
    //   if (data.statusCode == 200) {
    //     final decodedData = jsonDecode(data.body);
    //     final jsonData =
    //         Data.fromJson(data: decodedData, statusCode: data.statusCode);
    //     print(jsonData);
    //     return jsonData;
    //   } else {
    //     final decodedData = jsonDecode(data.body);
    //     final jsonData =
    //         Data.fromJson(data: decodedData, statusCode: data.statusCode);
    //     print(jsonData);
    //     return jsonData;
    //   }
    // }
  }

  getNewData({required String code, required String no}) async {
    var link = Uri.parse(
        'https://api.veriphone.io/v2/verify?phone=%2B$code-$no&key=4B1B5254BF1640E39E76AC5158A99001');
    var data = await http.get(link);
    if (data.statusCode == 200) {
      final decodedData = jsonDecode(data.body);

      final jsonData =
          Data.fromJson(data: decodedData, statusCode: data.statusCode);
      print(jsonData.career);
      return jsonData;
    } else {
      final decodedData = jsonDecode(data.body);
      // final jsonData =
      //     Data.fromJson(data: decodedData, statusCode: data.statusCode);

      return decodedData;
    }
  }
}

class Data {
  final String phone;
  final String phoneType;
  final String phoneRegion;
  final String country;
  final String countryCode;
  final String countryPrefix;
  final String intlNo;
  final String localNo;
  final String career;
  Data(
      {required this.country,
      required this.countryCode,
      required this.countryPrefix,
      required this.intlNo,
      required this.localNo,
      required this.phone,
      required this.career,
      required this.phoneRegion,
      required this.phoneType});

  factory Data.fromJson(
      {required Map<String, dynamic> data, required statusCode}) {
    //final jsonData = data['message'];
    // ignore: unnecessary_null_comparison

    final jsonData = data;
    if (statusCode == 200) {
      return Data(
        country: jsonData['country'],
        phoneRegion: jsonData['phone_region'],
        phoneType: jsonData['phone_type'],
        countryCode: jsonData['country_code'],
        countryPrefix: jsonData['country_prefix'],
        intlNo: jsonData['international_number'],
        phone: jsonData['phone'],
        localNo: jsonData['local_number'],
        career: jsonData['carrier'],
      );
    } else
      return Data(
        country: jsonData['message'],
        phoneRegion: jsonData['message'],
        phoneType: jsonData['message'],
        countryCode: jsonData['message'],
        countryPrefix: jsonData['message'],
        intlNo: jsonData['message'],
        phone: jsonData['message'],
        localNo: jsonData['message'],
        career: jsonData['message'],
      );
  }
}

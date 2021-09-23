import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  //const name({Key? key}) : super(key: key);

  final String phone;
  final String phoneType;
  final String phoneRegion;
  final String country;
  final String countryCode;
  final String countryPrefix;
  final String intlNo;
  final String localNo;
  final String career;
  ResultPage(
      {required this.country,
      required this.countryCode,
      required this.countryPrefix,
      required this.intlNo,
      required this.localNo,
      required this.career,
      required this.phone,
      required this.phoneRegion,
      required this.phoneType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(height: 30, child: Text('country: $country')),
              Divider(height: 5),
              Container(height: 30, child: Text('country_code: $countryCode')),
              Divider(height: 5),
              Container(
                  height: 30, child: Text('country_prefix: $countryPrefix')),
              Divider(height: 5),
              Container(
                  height: 30, child: Text('international_number: $intlNo')),
              Divider(height: 5),
              Container(height: 30, child: Text('local_number: $localNo')),
              Divider(height: 5),
              Container(height: 30, child: Text('phone: $phone')),
              Divider(height: 5),
              Container(height: 30, child: Text('phone_region: $phoneRegion')),
              Divider(height: 5),
              Container(height: 30, child: Text('phone_type: $phoneType')),
              Divider(height: 5),
              Container(height: 30, child: Text('carrier: $career')),
              Divider(height: 5),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('verify again'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )));
  }
}

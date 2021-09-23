import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:verify/result.dart';

import 'model.dart';

class HomePage extends StatefulWidget {
  // const SecondHomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool check = false;

  final codeContrlr = TextEditingController();

  final noContrlr = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final data = ApiCall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ModalProgressHUD(
          inAsyncCall: check,
          child: Center(
            child: Container(
              height: 300,
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verify_no',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextForm(
                          hintText: 'country code',
                          controller: codeContrlr,
                          validator: (value) {
                            if (value.isEmpty) return 'enter country code';
                            return null;
                          }),
                      TextForm(
                          hintText: 'phone no',
                          controller: noContrlr,
                          validator: (value) {
                            if (value.isEmpty) return 'enter phone no';
                            return null;
                          }),
                      SizedBox(height: 30),
                      ElevatedButton(
                        child: Text('Verify number'),
                        onPressed: () async {
                          print('pressed');
                          FocusScope.of(context).requestFocus(new FocusNode());
                          setState(() {
                            check = true;
                          });
                          await data
                              .getData(
                                  no: noContrlr.text.trim(),
                                  code: codeContrlr.text.trim())
                              .then((value) {
                            setState(() {
                              check = false;
                            });
                            codeContrlr.clear();
                            noContrlr.clear();
                            //  context(futureProvider);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResultPage(
                                  country: value.country,
                                  countryCode: value.countryCode,
                                  countryPrefix: value.countryPrefix,
                                  intlNo: value.intlNo,
                                  localNo: value.localNo,
                                  phone: value.phone,
                                  phoneRegion: value.phoneRegion,
                                  phoneType: value.phoneType,
                                  career: value.career);
                            }));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ),
        ));
  }
}

class TextForm extends StatelessWidget {
  const TextForm({this.controller, this.hintText, this.validator});
  final controller, hintText, validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

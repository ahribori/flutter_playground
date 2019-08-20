import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class SMS extends StatefulWidget {
  @override
  _SMSState createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  SmsQuery query = new SmsQuery();
  List<SmsMessage> smsMessages;

  getAllSMS() async {
    List<SmsMessage> messages = await query.getAllSms;
    messages.forEach((message) {
      print(message.body);
      print('---------------------');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Listening SMS"),
    );
  }

  @override
  void initState() {
    getAllSMS();
    super.initState();
  }
}

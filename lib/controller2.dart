import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_barcode_scanner/qrcode_barcode_scanner.dart';

class ScannerController2 extends GetxController {
  final RxString scanValue = RxString('');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    QrcodeBarcodeScanner(onScannedCallback: (String value) {
      scanValue.value = value;
    });
  }

  final TextEditingController title = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController comment = TextEditingController();

  void stringManipulation(value) {
    List<String> tempSplit;
    List<String> splitValue = value.split('Address:');
    if (splitValue[0].toString().contains('Title:') && splitValue[1].toString().contains('Date:')) {
      tempSplit = splitValue[0].split(':');
      if (tempSplit[0].toString().contains('Title')) {
        title.text = tempSplit[1];
        tempSplit.clear();
      }
    }
    //* title split
    tempSplit = splitValue[1].split('Date:');
    if (tempSplit[1].toString().contains('Time:')) {
      address.text = tempSplit[0];
    }
    //* Address split
    splitValue.clear();
    splitValue = tempSplit[1].split('Time:');
    if (splitValue[1].toString().contains('Comment:')) {
      date.text = splitValue[0];
    }
    //* Date split
    tempSplit.clear();
    tempSplit = splitValue[1].split('Comment:');
    time.text = tempSplit[0];
    comment.text = tempSplit[1];
    tempSplit.clear();
    splitValue.clear();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner_app_test2/controller2.dart';
import 'package:scanner_app_test2/cusotmTextfield.dart';

class HomePage2 extends StatelessWidget {
  HomePage2({super.key});

  final ScannerController2 scannerController2 = Get.find<ScannerController2>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin test app'),
        ),
        body: Obx(
          () => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text('Scanned data: ${scannerController2.scanValue}'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        scannerController2.stringManipulation(scannerController2.scanValue.value);
                      },
                      child: Text('Parse')),
                  CustomModifiedTextField(
                    controller: scannerController2.title,
                    hint: 'Title',
                    inputAction: TextInputAction.done,
                  ),
                  CustomModifiedTextField(
                    controller: scannerController2.address,
                    hint: 'Address',
                    inputAction: TextInputAction.done,
                  ),
                  CustomModifiedTextField(controller: scannerController2.date, hint: 'Date'),
                  CustomModifiedTextField(
                    controller: scannerController2.time,
                    hint: 'Time',
                    inputAction: TextInputAction.done,
                  ),
                  CustomModifiedTextField(
                    controller: scannerController2.comment,
                    hint: 'Comment',
                    inputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

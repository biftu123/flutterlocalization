import 'package:flutter/material.dart';
import 'package:flutterlocalization/constant.dart/appconstant.dart';
import 'package:flutterlocalization/controller/localizationController.dart';
import 'package:flutterlocalization/mode/languageModel.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

final List<String> textList = [
  
  'She bought bananas at the store',
  'Carrots are good for your health',
  'The dog is playing in the park',
  'The elephant is the largest land animal',

  // Add more sentences as needed
];

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localizationcontroller>(
        builder: (Localizationcontroller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title:  Text(
            "change_languges".tr,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DropdownButton(
                value: Localizationcontroller.selectedIndex,
                icon: const Icon(Icons.arrow_drop_down_circle),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                items: Appconstant.languages
                    .asMap()
                    .entries
                    .map((MapEntry<int, Languagemodel> entry) {
                  return DropdownMenuItem<int>(
                    value: entry.key,
                    child: Text(entry.value.languageCode.tr),
                  );
                }).toList(),
                onChanged: (int? value) {
                  setState(() {
                    Localizationcontroller.setlanguage(
                        Locale(Appconstant.languages[value!].languageCode),);
                    Localizationcontroller.setSelectedIndex(value);
                  });
                },
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: textList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(textList[index].tr),
            );
          },
        ),
      );
    });
  }
}

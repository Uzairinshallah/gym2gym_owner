import 'package:flutter/material.dart';

import '../assets/CColors.dart';
import '../main.dart';

class AddPackage extends StatelessWidget {
  AddPackage({Key? key}) : super(key: key);
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('GYMTOGYM'),
      ),
      backgroundColor: CColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              color: Colors.grey,
              child: const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Add New Package',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 60),
                child: getTextField('Name' )),
            getTextField('Duration' ),
            getTextField('Price' ),
            getTextField('Allow Attendance' ),
            getTextField('Discount' ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonWidget(context, 'Add Now', () {

              }),
            )



          ],
        ),
      ),
    );
  }

  Widget ButtonWidget(context, String btnText, onTap()) {
    return SizedBox(
      width: screenWidth / 2.1,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          onTap();

        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [CColors.buttonTwo, CColors.buttonOne]),
              borderRadius: BorderRadius.circular(40)),
          child: Container(
            width: screenWidth,
            height: 100,
            alignment: Alignment.center,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.deepOrange,
                    size: 40.0,
                  ),
                ),
                Text(
                  btnText,
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Padding getTextField(String hint) {
    return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 800,
            ),
            child: TextFormField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 3, horizontal: 10),
                  hintText: hint,
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: Colors.white38,
                  filled: true,
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                        width: 2.0,
                      ))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
        );
  }
}

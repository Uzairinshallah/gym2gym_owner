import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/models/packages_model.dart';

import '../assets/CColors.dart';
import '../assets/Functions.dart';

class AddPackage extends StatelessWidget {
  AddPackage({Key? key}) : super(key: key);
  var pId = TextEditingController();
  var gymId = TextEditingController();
  var name = TextEditingController();
  var packageId = TextEditingController();
  var type = TextEditingController();
  var duration = TextEditingController();
  var additionDate = TextEditingController();
  var allowedAttendance = TextEditingController();
  var price = TextEditingController();
  var stars = TextEditingController();
  var status = TextEditingController();
  late double screenWidth;
  late double screenHeight;
  bool check = true;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
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
            SizedBox(
              height: screenHeight * .04,
            ),
            getTextField('P Id', pId,  true),
            getTextField('Gym Id', gymId, true),
            getTextField('Package Id', packageId, false),
            getTextField('Type', type, true),
            getTextField('Duration', duration, true),
            // getTextField('Addition Date', additionDate),
            getTextField('Allow Attendance', allowedAttendance, false),
            getTextField('Price', price, false),
            getTextField('Stars', stars, false),
            getTextField('Status', status, true),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonWidget(context, 'Add Now', () {addCategory(context);}),
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

  Padding getTextField(String hint, TextEditingController controller, bool check) {
    String a = '';

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 800,
        ),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.left,
          keyboardType: (check) ? TextInputType.text : TextInputType.number,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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

  Future<void> addCategory(context) async {
    final collectionRef =
        FirebaseFirestore.instance.collection('package').doc();
    // final pID = collectionRef.id;
    try {
      PackagesModel packagesModel = PackagesModel(
        pId: pId.text,
        gymId: gymId.text,
        packageId: int.tryParse(packageId.text) ?? 0,
        name: name.text,
        type: type.text,
        duration: duration.text,
        allowedAttendance: int.tryParse(allowedAttendance.text) ?? 0,
        price: int.tryParse(price.text) ?? 0,
        stars: int.tryParse(stars.text) ?? 0,
        status: true,
        additionDate: Timestamp.fromDate(DateTime.now()),
      );

      await collectionRef.set(packagesModel.toMap());
      Navigator.pop(context);
      Functions.showSnackBar(context, 'Banner Added Successfully');
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      Functions.showSnackBar(context, 'Something Went Wrong');
      print(e.toString());
    }
  }
}

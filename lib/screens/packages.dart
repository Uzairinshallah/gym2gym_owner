import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/models/packages_model.dart';

import '../assets/CColors.dart';
import 'add_package.dart';
import 'homepage.dart';

class PackageScreen extends StatefulWidget {
  PackageScreen({Key? key}) : super(key: key);

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  late double screenWidth, screenHeight;

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('GYMTOGYM'),
        backgroundColor: Colors.transparent,

      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            color: Colors.grey,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'PACKAGES',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(context, 'Packages', () {}),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: ButtonWidget(context, 'Sold', () {}),
              ),
              ButtonWidget(context, 'Search', () {}),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: packagesModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.indigo.withOpacity(.5),
                          boxShadow: const [
                            BoxShadow(color: Colors.greenAccent, spreadRadius: 3),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text(packagesModel[index].name),
                                  Text('Price: ${packagesModel[index].price}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text('Allow Attendance: ${packagesModel[index].allowedAttendance}'),
                                  Text('Stars: ${packagesModel[index].stars}'),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPackage()),
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ButtonWidget(context, String btnText, onTap()) {
    return SizedBox(
      width: screenWidth * .3,
      height: 44,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [CColors.buttonTwo, CColors.buttonOne]),
              borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: screenWidth,
            height: 100,
            alignment: Alignment.center,
            child: Text(
              btnText,
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }

  final _collectionRef =
  FirebaseFirestore.instance.collection('package');

  List<PackagesModel> packagesModel = [];

  Future<void> getData() async {
    await _collectionRef.get().then((value) {

      value.docs.forEach((element) {
        PackagesModel model = PackagesModel.fromMap(element.data());
        packagesModel.add(model);
        print(packagesModel);
      });
    });
    setState(() {

    });
  }



}

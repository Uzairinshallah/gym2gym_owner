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
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: CColors.bgColor,
      body: Column(
        children: [
          Container(
            width: screenWidth,
            color: CColors.bgColorTwo,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'PACKAGES',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
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
                          color: CColors.buttonOne,
                          boxShadow: const [
                            BoxShadow(color: Colors.white, spreadRadius: 1),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getRichText(
                                    index, 'Name', packagesModel[index].name),
                                getRichText(index, 'Price',
                                    packagesModel[index].price.toString()),
                                getRichText(
                                    index,
                                    'Allow Attendance',
                                    packagesModel[index]
                                        .allowedAttendance
                                        .toString()),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ButtonWidget(context, 'Activate Package', () {}),
                                )
                              ],
                            ),
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
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPackage()),
                  );
                },
                child: Icon(
                  Icons.add,
                  color: CColors.bgColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getRichText(int index, String name, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: screenWidth * .42,
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
        Text(
          detail,
          style: TextStyle(
            color: CColors.bgColor,
          ),
        ),
      ],
    );
  }

  Widget ButtonWidget(context, String btnText, onTap()) {
    return SizedBox(
      // width: screenWidth * .8,
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
              color: CColors.bgColor,
              borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: screenWidth,
            height: 100,
            alignment: Alignment.center,
            child: Text(
              btnText,
              style: TextStyle(fontSize: 15,),
            ),
          ),
        ),
      ),
    );
  }

  final _collectionRef = FirebaseFirestore.instance.collection('package');

  List<PackagesModel> packagesModel = [];

  Future<void> getData() async {
    await _collectionRef.get().then((value) {
      value.docs.forEach((element) {
        PackagesModel model = PackagesModel.fromMap(element.data());
        packagesModel.add(model);
        print(packagesModel);
      });
    });
    setState(() {});
  }
}

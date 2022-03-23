import 'package:flutter/material.dart';

import '../assets/CColors.dart';
import 'add_package.dart';
import 'homepage.dart';

class PackageScreen extends StatelessWidget {
  PackageScreen({Key? key}) : super(key: key);
  late double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('GYMTOGYM'),
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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                              children: const [
                                Text('For Days: 30'),
                                Text('Price: 30'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Allow Attendance: 30'),
                                Text('Discount: 30'),
                              ],
                            ),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(top: 8.0),
                            //     child: ButtonWidget(context, 'Update', () {}),
                            //   ),
                            // )
                          ],
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
}

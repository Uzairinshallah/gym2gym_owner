import 'package:flutter/material.dart';
import 'package:gym2gym_owner/screens/widthdraw_details.dart';

import '../assets/CColors.dart';
import 'homepage.dart';

class AccountsScreen extends StatelessWidget {
  AccountsScreen({Key? key}) : super(key: key);
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
                'Accounts',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(context, 'Balance', () {}),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: ButtonWidget(context, 'Transactions', () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WidthdrawDetails()));
                    }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(context, 'Expense', () {}),

                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: ButtonWidget(context, 'Widthdraw', () {}),
                  ),
                ],
              ),

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
                                Text('Method'),
                                Text('Time'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Customer ID'),
                                Text('Date'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Package ID'),
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
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: FloatingActionButton(
          //       onPressed: () {},
          //       child: Icon(Icons.add),
          //
          //     ),
          //   ),
          // ),
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


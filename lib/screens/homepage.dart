import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/main.dart';
import 'package:gym2gym_owner/screens/SignupPage.dart';
import 'package:gym2gym_owner/screens/accounts.dart';
import 'package:gym2gym_owner/screens/customers_details.dart';
import 'package:gym2gym_owner/screens/employees_details.dart';
import 'package:gym2gym_owner/screens/packages.dart';
import 'package:gym2gym_owner/screens/timing.dart';

import '../assets/CColors.dart';
import 'attendance_details.dart';
import 'attendance_options.dart';
import 'events.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('GYMTOGYM'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: CColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getContainer('Total Customers'),
                  getContainer('Total Packages'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getContainer('Total Users'),
                  getContainer('Balance'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(.5),
                      borderRadius: BorderRadius.circular(25),
                      gradient:  LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          CColors.containerCol,
                          CColors.containerCol,

                        ],
                      )),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonWidget(context, "Packages" , (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PackageScreen()),
                              );
                            },),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: ButtonWidget(context, "Attendance", (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  AttendanceOptions()),
                                );
                              },),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonWidget(context, "Timing", (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const TimingScreen()),
                              );
                            },),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: ButtonWidget(context, "Events", (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const EventsScreen()),
                                );
                              },),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonWidget(context, "Accounts", (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  AccountsScreen()),
                              );
                            },),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: ButtonWidget(context, "Employees", (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const EmployeesDetailsScreen()),
                                );
                              },),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: ButtonWidget(context, "Customers", (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CustomersScreen()),
                                );
                              },),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget getContainer(String heading) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: (kIsWeb) ? screenWidth * .2 : screenWidth * .45,
        height: screenHeight * .18,

        constraints: BoxConstraints(
          minWidth: (kIsWeb) ? 200 : 100,
        ),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            gradient:  LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                CColors.buttonOne,
                CColors.buttonTwo,
              ],
            )),
        child: Center(
          child: Text(
            heading,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget ButtonWidget(context, String btnText, onTap()) {
    return Container(
      width: (kIsWeb) ? screenWidth * .4 : screenWidth * .4,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.history_rounded,
                    color: CColors.bgColor,
                    size: 20.0,
                  ),
                ),
                Text(
                  btnText,
                  style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/providers/attendance_provider.dart';
import 'package:provider/provider.dart';
import '../assets/CColors.dart';




class AttendanceOptions extends StatefulWidget {
  AttendanceOptions({Key? key}) : super(key: key);



  @override
  State<AttendanceOptions> createState() => _AttendanceOptionsState();
}

// DateTime? reg_date;


class _AttendanceOptionsState extends State<AttendanceOptions> {
  DateTime selectedDate = DateTime.now();

  var screenWidth, screenHeight;
  late AttendanceProvider model;



  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Consumer<AttendanceProvider>(builder: (context, model, child) {
      this.model = model;
      return Scaffold(
          appBar: AppBar(
          title: Text('GYMTOGYM'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: CColors.bgColor,
        body: SizedBox()
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.all(18.0),
        //       child: Text(
        //         'Please Select Date To Update Attendance of Users',
        //         style: TextStyle(color: Colors.white, fontSize: 14),
        //       ),
        //     ),
        //     // getDateField(reg_date, context),
        //     SizedBox(
        //       width: screenWidth * .9,
        //       height: screenHeight * .07,
        //       child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //             primary: Colors.white10,
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 50, vertical: 20),
        //             textStyle: const TextStyle(
        //                 fontSize: 30, fontWeight: FontWeight.bold)),
        //         child: Center(
        //           child: Text(
        //             // ignore: unnecessary_null_comparison
        //               model.reg_date != null
        //                   ? DateFormat('dd-MM-yyyy')
        //                   .format(model.reg_date!)
        //                   .toString()
        //                   : 'NULL',
        //               // DateFormat('dd-MM-yyyy')
        //               //     .format(DateTime.now())
        //               //     .toString(),
        //               style: const TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 12,
        //               )),
        //         ),
        //         onPressed: () {
        //           //show date picker and stores in reg_date
        //           showDatePicker(
        //             context: context,
        //             lastDate: DateTime.now(),
        //             initialDate: DateTime.now(),
        //             firstDate: DateTime(2020),
        //           ).then((date) {
        //             setState(() {
        //               model.reg_date = date;
        //               print(date);
        //               if(model.reg_date != null){
        //                 model.checkDate(true);
        //                 print('date done');
        //               }
        //             });
        //           });
        //
        //         },
        //       ),
        //     ),
        //     SizedBox(
        //       height: screenHeight * .03,
        //     ),
        //     ButtonWidget(
        //         context,
        //         "Update Attendance",
        //             () {
        //           if(model.selectDate){
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => UpdateAttendance()),
        //             );
        //           }
        //           else
        //             {
        //               print('no date selected');
        //             }
        //
        //         },
        //     ),
        //     SizedBox(
        //       height: screenHeight * .03,
        //     ),
        //     ButtonWidget(
        //         context,
        //         "View Attendance",
        //             () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => AttendanceDetailsScreen()),
        //           );
        //         },
        //     ),
        //   ],
        // ),
      );
    }
    );

  }


  Widget ButtonWidget(context, String btnText, onTap()) {
    return Center(
      child: Container(
        width: (kIsWeb) ? screenWidth * .4 : screenWidth * .8,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Ink(
            decoration: BoxDecoration(
                color: CColors.buttonTwo,
                borderRadius: BorderRadius.circular(8)),
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
      ),
    );
  }
}

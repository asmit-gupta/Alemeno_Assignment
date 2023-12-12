// ignore_for_file: prefer_final_fields, unused_field

import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/app/views/widgets/button.dart';
import 'package:alemeno_app/core/utils/date_format.dart';
import 'package:alemeno_app/core/utils/time_format.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  LabTestController calendarController = Get.find<LabTestController>();
  CalendarFormat _format = CalendarFormat.month;
  DateTime? _focusDay;
  DateTime? _currentDay;
  int? _currentIndex;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String? selectedDate;
  String? selectedTime;

  _CalendarPageState() {
    _currentDay = calendarController.currentday.value;
    _focusDay = calendarController.focusday.value;
    if (calendarController.calendarIndex.value != 20) {
      _currentIndex = calendarController.calendarIndex.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'Book Appointment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0.sp,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: Colors.blue,
            itemBuilder: (context) {
              return const [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "View more",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 12.0.hp,
          width: double.infinity,
          color: backgroundColor,
          child: UnconstrainedBox(
            child: Button(
              color: _dateSelected == true && _timeSelected == true
                  ? darkBlue
                  : Colors.grey,
              text: _dateSelected == false && _timeSelected == false
                  ? 'Next'
                  : _dateSelected == true && _timeSelected == true
                      ? 'Schedule'
                      : 'Confirm',
              height: 7.0.hp,
              width: 90.0.wp,
              onTap: _timeSelected == true && _dateSelected == true
                  ? () {
                      Navigator.of(context).pop();
                    }
                  : null,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0.sp),
        children: <Widget>[
          SizedBox(
            height: 1.0.hp,
          ),
          Padding(
            padding: EdgeInsets.all(3.0.sp),
            child: Text(
              'Select Date',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _tableCalendar(),
          SizedBox(
            height: 1.5.hp,
          ),
          Padding(
            padding: EdgeInsets.all(3.0.sp),
            child: Text(
              'Select Time',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              6.0.sp,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                mainAxisSpacing: 7.0.sp,
                crossAxisSpacing: 4.0.sp,
              ),
              itemCount: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _timeSelected = true;
                      _currentIndex = index;
                      calendarController.calendarIndex.value = index;
                      selectedTime =
                          '${(index + 8) % 12 == 0 ? 12 : (index + 8) % 12}:00 ${(index + 8) >= 12 ? "PM" : "AM"}';
                      calendarController.time.value = formatTime(selectedTime!);
                      print(calendarController.time.value);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(2.0.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentIndex == index ? darkBlue : darkBlue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: _currentIndex == index ? darkBlue : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${(index + 8) % 12 == 0 ? 12 : (index + 8) % 12}:00 ${(index + 8) >= 12 ? "PM" : "AM"}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: _currentIndex == index ? Colors.white : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //table calendar
  Widget _tableCalendar() {
    return Center(
      child: Material(
        elevation: 1.5,
        shadowColor: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: 90.0.wp,
          height: 48.0.hp,
          child: TableCalendar(
            headerStyle: const HeaderStyle(
              titleCentered: true,
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: darkBlue,
              ),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: darkBlue,
              ),
            ),
            focusedDay: _focusDay!,
            firstDay: DateTime.now(),
            lastDay: DateTime(2024, 12, 31),
            calendarFormat: _format,
            currentDay: _currentDay,
            rowHeight: 48,
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: darkBlue,
                shape: BoxShape.circle,
              ),
            ),
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            onFormatChanged: (format) {
              setState(() {
                _format = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                calendarController.currentday.value = selectedDay;
                calendarController.focusday.value = focusedDay;
                _currentDay = selectedDay;
                _focusDay = focusedDay;
                _dateSelected = true;
                selectedDate = selectedDay.toString();
                calendarController.date.value = formatDateTime(selectedDay);
                print(calendarController.date.value);
              });
            },
          ),
        ),
      ),
    );
  }
}

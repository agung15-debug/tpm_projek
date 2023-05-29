import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';

class TimezonePage extends StatefulWidget {
  const TimezonePage({super.key});

  @override
  State<TimezonePage> createState() => _TimezonePageState();
}

class _TimezonePageState extends State<TimezonePage> {
  var timeZone = ['WIB', 'WITA', 'WIT', 'GMT'];
  var selectedTimeZone = 'WIB';
  var time = DateTime.now();
  var timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => updateTime());
    initializeDateFormatting();
  }

  @override
  void dispose() {
    timer.cancel();
    timer;
    super.dispose();
  }

  void updateTime() {
    setState(() {
      time = DateTime.now();
    });
  }

  int _getTimeDifference(String timeZone) {
    switch (timeZone) {
      case 'WIB':
        return 0;
      case 'WITA':
        return 1;
      case 'WIT':
        return 2;
      case 'GMT':
        return -7;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Timezone',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              dropdownColor: backgroundColor2,
              value: selectedTimeZone,
              items: timeZone.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: primaryTextStyle.copyWith(fontWeight: light),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                if (mounted) {
                  setState(() {
                    selectedTimeZone = value!;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              'Waktu di $selectedTimeZone',
              style:
                  primaryTextStyle.copyWith(fontSize: 20, fontWeight: medium),
            ),
            SizedBox(height: 20),
            Text(
              '${DateFormat('EEEE', 'id').format(time.add(Duration(hours: _getTimeDifference(selectedTimeZone))))}, ${DateFormat('d MMMM y', 'id').format(time.add(Duration(hours: _getTimeDifference(selectedTimeZone))))}',
              style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            SizedBox(height: 10),
            Text(
              DateFormat('HH:mm:ss')
                  .format(time.add(
                      Duration(hours: _getTimeDifference(selectedTimeZone))))
                  .toString(),
              style:
                  primaryTextStyle.copyWith(fontSize: 50, fontWeight: semiBold),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60), child: header()),
      body: content(),
    );
  }
}

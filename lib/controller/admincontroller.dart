import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zeal/screens/added.dart';

List<Map<String, dynamic>> Admin = [];

void adddetails(
    {required Map<String, dynamic> details, required BuildContext context}) {
  final existingusers =
      Admin.where((user) => user['username'] == details['username']).toList();

  if (existingusers.isEmpty) {
    Admin.add(details);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Added(),
        ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User already exist'),
        duration: Duration(seconds: 4),
      ),
    );
  }
}

void removeDetailsAt(int index) {
  if (index < Admin.length) {
    Admin.removeAt(index);
  } else {
    print('Invalid index');
  }
}

void editdetails(
    {required Map<String, dynamic> edituser,
    required int index,
    required BuildContext context}) {
  Admin[index] = edituser;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Added(),
      ));
}

void removeLocation(int userindex, int index) {
  Admin[userindex]['location'].removeAt(index);
}

void addmoreLocation(
    {required int userindex,
    required String location,
    required BuildContext context}) {
  List<String> locations = List<String>.from(Admin[userindex]['location']);

  if (!locations.contains(location)) {
    Admin[userindex]['location'].add(location);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('This location already exists'),
      duration: Duration(seconds: 4),
    ));
  }
}

ValueNotifier<num> totalCount = ValueNotifier(0);

void totalLOcation() {
  num count = 0;
  Admin.forEach((element) {
    count = count + element['location'].length;
  });
  totalCount.value = count;
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// to show toast msg
void showToastMsg(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    timeInSecForIosWeb: 1,
    textColor: Colors.black,
    backgroundColor: Colors.grey[300],
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:quotes/core/utils/app_colors.dart';

class Constants {
  static void showErrorDailog(
      {required BuildContext context, required String msg}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: const Text(
              'Ok',
            ),
          )
        ],
      ),
    );
  }

  // static void showToast(
  //     {required BuildContext context,
  //     required String msg,
  //     Color? color,
  //     ToastGravity? gravity}) {
  //   Fluttertoast.showToast(
  //       toastLength: Toast.LENGTH_LONG,
  //       msg: msg,
  //       backgroundColor: color ?? AppColors.primary,
  //       gravity: gravity ?? ToastGravity.BOTTOM);
  // }
}

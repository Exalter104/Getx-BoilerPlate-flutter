import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/resources/colors/app_colors.dart';

// ......................FOCUS CHANGE..............................
class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
// ......................TOAST..............................

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: AppColor.blackColor);
  }
// ......................SNACKBAR..............................

  static snackBar(String newtitle, String newmessage) {
    Get.snackbar(newtitle, newmessage);
  }
}

// ......................CUSTOM BUTTON..............................
class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double width;
  final double height;
  final TextStyle textStyle;
  final EdgeInsets padding;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = Colors.blue,
    this.width = 200.0,
    this.height = 50.0,
    this.textStyle = const TextStyle(fontSize: 16.0, color: Colors.white),
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: padding,
        ),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}

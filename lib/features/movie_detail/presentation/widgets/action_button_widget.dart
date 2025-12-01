import 'package:flutter/material.dart';

Widget actionButtonWidget({
  required void Function()? onTap,
  required Color buttonColor,
  required String title,
  required IconData? icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 552,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(color: buttonColor, width: 1.5),
          color: Color.fromRGBO(31, 31, 31, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: buttonColor),
            ),
            Icon(icon, color: buttonColor),
          ],
        ),
      ),
    ),
  );
}

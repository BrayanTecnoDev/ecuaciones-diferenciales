import 'package:flutter/material.dart';

void navigateToPage(BuildContext context, var route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}
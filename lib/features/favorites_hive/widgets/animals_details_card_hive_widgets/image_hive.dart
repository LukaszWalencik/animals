import 'package:flutter/material.dart';

Image image({required String text}) {
  return Image.network(
    text,
    width: 200,
    height: 200,
  );
}

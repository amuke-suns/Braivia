import 'package:flutter/material.dart';

const circularRadius = Radius.circular(12);

const kTopCurveDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: circularRadius,
    topRight: circularRadius,
  ),
);

const kBottomCurveDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    bottomLeft: circularRadius,
    bottomRight: circularRadius,
  ),
);

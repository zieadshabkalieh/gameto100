import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';


final _random = new Random();
int min=0;
int max=0;
MyRandom (int min, int max) {
  return min + _random.nextInt(max - min);
}
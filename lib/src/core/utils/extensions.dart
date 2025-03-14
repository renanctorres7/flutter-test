import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

extension EitherExt<L, R> on Either<L, R> {
  R asRight() => (this as Right).value;
}

extension BuildContextExt on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}

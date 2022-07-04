import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueObx<T extends RxInterface> extends ObxWidget {
  final Widget Function(T) builder;
  final T data;

  const ValueObx(this.data, this.builder, {Key? key}) : super(key: key);

  @override
  Widget build() => builder(data);
}

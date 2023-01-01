import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:hoc081098_portfolio/widgets/header.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeBloc implements BaseBloc {
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  @override
  void dispose() {}

  void scrollTo(HeaderItem item) {
    final index = headerItems.indexOf(item);
    assert(index != -1);

    itemScrollController.scrollTo(
      index: index * 2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:futnewz/colors.dart';
import 'package:core/core.dart';

class ActionChips extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Categories selectedType;
  final Categories categories;
  final bool selected;

  const ActionChips(
      {Key key,
      @required this.title,
      @required this.onPressed,
      this.selectedType,
      @required this.categories,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ChoiceChip(
        label: Text(
          title,
        ),
        onSelected: onPressed,
        selected: false,
      ),
    );
  }
}

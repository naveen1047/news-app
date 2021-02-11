import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBar extends StatefulWidget {
  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  List<Categories> category;
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List<Widget>.generate(
        Categories.values.length,
        (int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: ChoiceChip(
              selectedColor: Theme.of(context).colorScheme.onPrimary,
              label: Text(
                getCategory(Categories.values[index]),
              ),
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : _value;
                });
                BlocProvider.of<NewsBloc>(context).add(
                  FetchTopHeadlinesCategory(
                      categories: Categories.values[index]),
                );
              },
            ),
          );
        },
      ).toList(),
    );
  }
}

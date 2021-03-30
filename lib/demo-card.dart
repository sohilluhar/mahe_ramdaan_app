import 'package:flutter/material.dart';

class _DemoSectionOptionsItem extends StatelessWidget {
  const _DemoSectionOptionsItem({
    Key key,
    this.title
    }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surface ,
      child: InkWell(
//        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: double.infinity),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2.apply(
              color:
               colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
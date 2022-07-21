import 'package:flutter/material.dart';

class CardListContent extends StatelessWidget {
  const CardListContent({
    Key? key,
    this.title,
    this.subtitle,
    this.leading,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading ?? const SizedBox(),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              if (subtitle != null)
                Text(
                  subtitle ?? '',
                  style: Theme.of(context).textTheme.caption,
                ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right_rounded)
      ],
    );
  }
}

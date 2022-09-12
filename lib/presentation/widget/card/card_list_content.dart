import 'package:flutter/material.dart';

class CardListContent extends StatelessWidget {
  const CardListContent(
      {Key? key,
      this.title,
      this.subtitle,
      this.leading,
      this.isWithTrailing = true})
      : super(key: key);

  final String? title;
  final String? subtitle;
  final Widget? leading;
  final bool? isWithTrailing;

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
                style: Theme.of(context).textTheme.headline6,
              ),
              if (subtitle != null)
                Text(
                  subtitle ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
            ],
          ),
        ),
        if (isWithTrailing!) const Icon(Icons.chevron_right_rounded)
      ],
    );
  }
}

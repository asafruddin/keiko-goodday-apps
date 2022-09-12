// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/utils/debouncer.dart';

class SearchFilterBar extends StatefulWidget {
  ///  label - String ,isRequired : No
  ///  onSearchChanged - Function(String)  ,isRequired : No
  ///  onFilterChanged - Function() ,isRequired : No
  ///  searchDecoration - InputDecoration  ,isRequired : No
  ///  searchStyle - TextStyle ,isRequired :  No
  ///  cursorColor - Color ,isRequired : No
  ///  isFilter - bool - default true
  /// searchEnabled - bool - default true
  const SearchFilterBar({
    Key? key,
    required this.label,
    required this.onSearchChanged,
    this.onFilterChanged,
    this.isFilter = true,
    this.searchEnabled = true,
    this.onClear,
    this.hintStyle,
    this.inputStyle,
    this.cursorColor,
  }) : super(key: key);

  final String label;
  final Function(String) onSearchChanged;
  final Function()? onFilterChanged;
  final bool? isFilter;
  final bool? searchEnabled;
  final Function()? onClear;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final Color? cursorColor;

  @override
  State createState() => _SearchFilterBarState();
}

class _SearchFilterBarState extends State<SearchFilterBar> {
  bool _isSearch = false;
  final _fnSearch = FocusNode();
  final _debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    // Use row as Root view
    return GestureDetector(
      onTap: () {
        if (!_isSearch) {
          setState(() {
            _isSearch = true;
            _fnSearch.requestFocus();
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!widget.searchEnabled!) const SizedBox(width: 50),
          // Handle Animated Change view for Title and TextField Search
          Expanded(
            // Use animated Switcher to show animation in transition widget
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //animated from right to left
                final inAnimation =
                    Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                        .animate(animation);
                //animated from left to right
                final outAnimation =
                    Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                        .animate(animation);

                // show different animation base on key
                if (child.key == const ValueKey('textF')) {
                  return ClipRect(
                    child: SlideTransition(position: inAnimation, child: child),
                  );
                } else {
                  return ClipRect(
                    child:
                        SlideTransition(position: outAnimation, child: child),
                  );
                }
              },
              child: _isSearch
                  ?
                  //Container of SearchView
                  SizedBox(
                      key: const ValueKey('textF'),
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          focusNode: _fnSearch,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          minLines: 1,
                          cursorColor: widget.cursorColor ??
                              Theme.of(context).colorScheme.onPrimary,
                          style: widget.inputStyle ??
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .foregroundColor),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: false,
                            hintText: 'search...',
                            hintStyle: widget.hintStyle ??
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor!
                                        .withOpacity(0.8)),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          onChanged: (value) {
                            _debouncer.run(() {
                              widget.onSearchChanged(value);
                            });
                          },
                        ),
                      ),
                    )
                  :
                  //Container of Label
                  SizedBox(
                      key: const ValueKey('align'),
                      height: 60,
                      child: Align(
                        child: Text(
                          widget.label,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
            ),
          ),
          // Handle Animated Change view for Search Icon and Close Icon
          if (widget.searchEnabled!)
            IconButton(
              padding: EdgeInsets.zero,
              icon:
                  // Use animated Switcher to show animation in
                  // transition widget
                  AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  //animated from top to bottom
                  final inAnimation =
                      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                          .animate(animation);
                  //animated from bottom to top
                  final outAnimation = Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(animation);

                  // show different animation base on key
                  if (child.key == const ValueKey('close')) {
                    return ClipRect(
                      child: SlideTransition(
                        position: inAnimation,
                        child: child,
                      ),
                    );
                  } else {
                    return ClipRect(
                      child:
                          SlideTransition(position: outAnimation, child: child),
                    );
                  }
                },
                child: _isSearch
                    ?
                    //if is search, set icon as Close
                    const Icon(
                        Icons.close_rounded,
                        key: ValueKey('close'),
                      ) //if is !search, set icon as Search
                    : const Icon(
                        Icons.search_rounded,
                        key: ValueKey('search'),
                      ),
              ),
              onPressed: () {
                setState(() {
                  _isSearch = !_isSearch;
                  if (!_isSearch) widget.onSearchChanged('');

                  if (_isSearch) _fnSearch.requestFocus();
                });
              },
            ),
          if (widget.isFilter!)
            _isSearch
                ? const SizedBox.shrink()
                : IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: widget.onFilterChanged,
                    icon: const Icon(Icons.filter_alt_rounded),
                  )
          else
            const SizedBox.shrink()
        ],
      ),
    );
  }
}

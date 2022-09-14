import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'line.dart';

class ExpandableCard extends StatefulWidget {
  final Widget headerChild;
  final Widget expandedChild;

  const ExpandableCard(
      {required this.headerChild, required this.expandedChild});

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = _isExpanded ? false : true;
          });
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  widget.headerChild,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: line(MediaQuery.of(context).size.width, 1.0,
                        Colors.grey[200]),
                  ),
                  _isExpanded
                      ? widget.expandedChild
                      : Text("Click for more detail"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

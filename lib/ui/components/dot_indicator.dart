import 'package:flutter/material.dart';


class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 24, 1, 24),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isActive ? 8 : 8,
          width: 8,
          decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
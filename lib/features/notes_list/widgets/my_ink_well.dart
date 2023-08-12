import 'package:flutter/material.dart';

class MyInkWell extends StatefulWidget {
  final BorderRadius borderRadius;
  final void Function()? onTap;
  final Widget Function(bool hover) builder;

  const MyInkWell({
    super.key,
    this.onTap,
    required this.builder,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  State<MyInkWell> createState() => _MyInkWellState();
}

class _MyInkWellState extends State<MyInkWell> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (mounted) {
          setState(() {
            hover = true;
          });
        }
      },
      onExit: (event) {
        if (mounted) {
          setState(() {
            hover = false;
          });
        }
      },
      child: InkWell(
        borderRadius: widget.borderRadius,
        onTap: widget.onTap,
        child: widget.builder(hover),
      ),
    );
  }
}
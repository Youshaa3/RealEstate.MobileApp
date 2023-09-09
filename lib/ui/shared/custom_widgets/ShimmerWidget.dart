import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatefulWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular(
      {this.width = double.infinity, this.height = double.infinity})
      : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular(
      {this.width = double.infinity,
        this.height = double.infinity,
        this.shapeBorder = const CircleBorder()});

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey[250]!,
    highlightColor: Colors.grey[350]!,
    child: Container(
      width: widget.width,
      height: widget.height,
      decoration: ShapeDecoration(
        color: Colors.grey[400]!,
        shape: widget.shapeBorder,
      ),
    ),
  );
}


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationList extends StatefulWidget {
  final Key? key;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final List<Widget>? children;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  final int duration;
  final double reBounceDepth;

  AnimationList({
    this.key,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.children,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.duration = 1300,
    this.reBounceDepth = 10,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
  });

  @override
  _AnimationListState createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bounceUp, bounceReUp, bounceDown, opacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);

    bounceDown = Tween<double>(begin: 0.0, end: widget.reBounceDepth).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.7, curve: Curves.easeInOut),
      ),
    );
    bounceReUp = Tween<double>(begin: 0.0, end: widget.reBounceDepth).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.7, 1, curve: Curves.easeInOut),
      ),
    );
    opacity = Tween<double>(begin: 0.3, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1, curve: Curves.easeInOut),
      ),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ListView(
            key: widget.key,
            controller: widget.controller,
            primary: widget.primary,
            physics: widget.physics,
            shrinkWrap: widget.shrinkWrap,
            padding: widget.padding,
            addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
            addRepaintBoundaries: widget.addRepaintBoundaries,
            addSemanticIndexes: widget.addSemanticIndexes,
            semanticChildCount: widget.semanticChildCount,
            dragStartBehavior: widget.dragStartBehavior,
            keyboardDismissBehavior: widget.keyboardDismissBehavior,
            restorationId: widget.restorationId,
            clipBehavior: widget.clipBehavior,
            children: widget.children!.asMap().entries.map((item) {
              bounceUp = Tween<double>(
                  begin: MediaQuery.of(context).size.height, end: 0)
                  .animate(
                CurvedAnimation(
                  parent: controller,
                  curve: Interval(
                      0.0 + (item.key * 0.1) >= 0.5 ? 0.5 : item.key * 0.1, 0.5,
                      curve: Curves.easeInOut),
                ),
              );
              return Opacity(
                opacity: item.key != 0 ? opacity.value : 1,
                child: Container(
                  margin: item.key == 0
                      ? null
                      : EdgeInsets.only(
                      top: bounceUp.value +
                          bounceDown.value -
                          bounceReUp.value),
                  child: item.value,
                ),
              );
            }).toList());
      },
    );
  }
}

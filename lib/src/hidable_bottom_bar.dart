import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HidableBottomBar extends StatefulWidget {
  final Widget child;
  final double height;
  final Duration duration;

  HidableBottomBar({
    required this.child,
    this.height = 56.0,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  _HidableBottomBarState createState() => _HidableBottomBarState();
}

class _HidableBottomBarState extends State<HidableBottomBar> {
  ScrollController? _controller;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller!.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller!.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    } else if (_controller!.position.userScrollDirection == ScrollDirection.forward) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller!.removeListener(_scrollListener);
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            _scrollListener();
          }
          return true;
        },
        child: Stack(
          children: [
            widget.child,
            AnimatedPositioned(
              duration: widget.duration,
              bottom: _isVisible ? 0 : -widget.height,
              left: 0,
              right: 0,
              child: Container(
                height: widget.height,
                color: Colors.blue,
                child: Center(child: Text('Bottom Bar')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

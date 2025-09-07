
import 'package:flutter/cupertino.dart';

class KeepAliveWrapper extends StatefulWidget {
  final  bool? keepAlive;
  final Widget child;

  const KeepAliveWrapper({super.key, this.keepAlive = true, required this.child});

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.keepAlive!;
}

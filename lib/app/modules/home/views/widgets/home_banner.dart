import 'package:flutter/cupertino.dart';
import 'package:xm_shop/app/utils/screen_adapter.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        ScreenAdapter.width(30),
        ScreenAdapter.width(20),
        ScreenAdapter.width(30),
        0,
      ),
      child: Container(
        height: ScreenAdapter.height(420),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
          image: const DecorationImage(image: AssetImage("assets/images/banner.png"), fit: BoxFit.cover)
        ),
      ),
    );
  }
}

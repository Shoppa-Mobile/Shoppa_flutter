import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/auth/authScreen.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  static String routeName = "/Splash";
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 7),
        () => Navigator.pushReplacementNamed(
            context, AuthenticationScreen.routeName));
    SizeConfig().init(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: SvgPicture.asset(
            'assets/logos/shoppa logo2.svg',
            height: getPropHeight(100),
            width: getPropWidth(100),
          ),
        ),
      ),
    );
  }
}

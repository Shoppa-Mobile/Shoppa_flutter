import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';

// ignore: must_be_immutable
class Loading extends StatefulWidget {
  bool isLoading;
  final String? text;
  final Widget child;
  Loading({
    Key? key,
    required this.child,
    this.text,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: widget.isLoading,
      color: primaryColor,
      opacity: 0.3,
      progressIndicator: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: primaryColor,
              strokeWidth: 2.0,
            ),
            const SizedBox(height: 10),
            Text(
              widget.text ?? " ",
              style: headerStyle3.copyWith(
                color: primaryColor,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
      child: widget.child,
    );
  }
}

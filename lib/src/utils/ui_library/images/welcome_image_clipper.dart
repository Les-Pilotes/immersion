import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    debugPrint("Path");

    path.lineTo(0, size.height); // Start at top left
    path.lineTo(0, size.height - 50);

    path
      ..quadraticBezierTo(
        -50,
        size.height - 20,
        0,
        size.height - 10,
      );

    path.lineTo(0, size.height - 40);

    //path.moveTo(0, size.height - 50);

    path
      ..quadraticBezierTo(
        size.width / 7,
        size.height,
        size.height / 2,
        size.width / 1.9,
      )

      ..lineTo(
        size.width * 2,
        0,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomShapeImage extends StatelessWidget {
  const CustomShapeImage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShapeClipper(),
      //child: Image.asset('assets/your_image.jpg', // Replace with your actual image pathfit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,),
      child: child,
    );
  }
}

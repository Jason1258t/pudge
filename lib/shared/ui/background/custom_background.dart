import 'package:flutter/material.dart';
import 'package:pudge/shared/theme/colors.dart';

class CustomBackground extends StatefulWidget {
  const CustomBackground({super.key, required this.scaffold});

  final Scaffold scaffold;

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bcd,
      child: Stack(children: [...buildBcdItems(context), widget.scaffold]),
    );
  }

  List<Widget> buildBcdItems(BuildContext context) {
    final size = screenSize(context);
    return [
      Positioned(
        top: size.height * 0.135193133,
        left: size.width * 0.735,
        child: ellipse([
          const Color(0xffB379DF),
          const Color(0xff360060).withAlpha(0),
        ], size.width),
      ),
      Positioned(
        left: -size.width * 0.5325,
        bottom: -size.width * 0.5325,
        child: ellipse([
          const Color(0xffC45647),
          const Color(0xffD25A63).withAlpha(0),
        ], size.width),
      ),
      Positioned(
        right: -size.width * 0.5325,
        bottom: -size.width * 0.5325,
        child: ellipse([
          const Color(0xffB379DF),
          const Color(0xff360060).withAlpha(0),
        ], size.width),
      ),

      Positioned(
        top: 270,
        left: 20,
        child: ellipse([
          Colors.deepPurple.withAlpha(180),
          Colors.purple.withAlpha(0),
        ], 130),
      ),

      Positioned(
        top: 160,
        right: 40,
        child: ellipse([
          Color(0xff9C27B0).withAlpha(180),
          Color(0xff9C27B0).withAlpha(0),
        ], 30),
      ),
      Positioned(
        bottom: 260,
        left: 80,
        child: ellipse([
          Color(0xffF44336).withAlpha(140),
          Color(0xffF44336).withAlpha(0),
        ], 70),
      ),
      Positioned(
        top: 100,
        left: 30,
        child: ellipse([
          Color(0xffE57373).withAlpha(180),
          Color(0xffE57373).withAlpha(0),
        ], 25),
      ),
      Positioned(
        bottom: 200,
        right: 80,
        child: ellipse([
          Color(0xffB39DDB).withAlpha(180),
          Color(0xffB39DDB).withAlpha(0),
        ], 35),
      ),
    ];
  }

  Size screenSize(context) => MediaQuery.of(context).size;

  Widget ellipse(List<Color> colors, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        gradient: RadialGradient(colors: colors),
      ),
    );
  }
}

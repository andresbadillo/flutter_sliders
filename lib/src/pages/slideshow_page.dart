import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliders_demo/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1faee),
      body: Slideshow(
        puntosArriba: false,
        colorPrimario: Color(0xffe63946),
        colorsecundario: Colors.grey,
        slides: [
          SvgPicture.asset('assets/svg/slide-1.svg'),
          SvgPicture.asset('assets/svg/slide-2.svg'),
          SvgPicture.asset('assets/svg/slide-3.svg'),
          SvgPicture.asset('assets/svg/slide-4.svg'),
          SvgPicture.asset('assets/svg/slide-5.svg'),
        ],
      ),
    );
  }
}

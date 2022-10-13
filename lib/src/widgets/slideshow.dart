import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// import 'package:flutter_svg/svg.dart';

import '../models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorsecundario;

  const Slideshow({
    Key? key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorsecundario = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (puntosArriba)
                _Dots(
                  totalSlides: slides.length,
                  colorPrimario: colorPrimario,
                  colorsecundario: colorsecundario,
                ),
              Expanded(
                child: _Slides(
                  slides: slides,
                ),
              ),
              if (!puntosArriba)
                _Dots(
                  totalSlides: slides.length,
                  colorPrimario: colorPrimario,
                  colorsecundario: colorsecundario,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color colorPrimario;
  final Color colorsecundario;

  const _Dots({
    Key? key,
    required this.totalSlides,
    required this.colorPrimario,
    required this.colorsecundario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides,
            (i) => _Dot(
                  index: i,
                  colorPrimario: colorPrimario,
                  colorsecundario: colorsecundario,
                )),
        // children: [
        //   _Dot(index: 0),
        //   _Dot(index: 1),
        //   _Dot(index: 2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorsecundario;

  const _Dot({
    Key? key,
    required this.index,
    required this.colorPrimario,
    required this.colorsecundario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5)
            ? colorPrimario
            : colorsecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({Key? key, required this.slides}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      // print('Página actual: ${pageViewController.page}');
      // Actualizar el provider: SliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        physics: const BouncingScrollPhysics(),
        // children: [
        //   _Slide(svg: 'assets/svg/slide-1.svg'),
        //   _Slide(svg: 'assets/svg/slide-2.svg'),
        //   _Slide(svg: 'assets/svg/slide-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({
    Key? key,
    required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

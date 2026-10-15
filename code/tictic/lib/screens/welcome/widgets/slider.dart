import 'package:flutter/material.dart';
import 'package:tictic/constants/colors.dart';
import 'package:tictic/screens/welcome/widgets/bullet.dart';
import 'package:tictic/screens/welcome/widgets/text_slide.dart';

import '../../../constants/sizes.dart';

class Slider extends StatefulWidget {
  const Slider({super.key});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final _items = [
    'L’harmonie financière dans vos groupes, en toute simplicité !',
    'Calculs instantanés, équité garantie avec TicTic !',
    'Calculs fastidieux ? Non merci. Optez pour la simplicité avec TicTic !',
    'TicTic : Vos dépenses partagées en toute simplicité !',
  ];

  int _currentSlideIDX = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kTextSliderHeight,
          child: PageView.builder(
            onPageChanged: (idx) {
              setState(() {
                _currentSlideIDX = idx;
              });
            },
            controller: _pageController,
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return TextSlide(text: _items[index]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _items.map((stringItem) {
              return Bullet(
                onTap: () {
                  _pageController.jumpToPage(_items.indexOf(stringItem));
                  setState(() {
                    _currentSlideIDX = _items.indexOf(stringItem);
                  });
                },
                color: _currentSlideIDX == _items.indexOf(stringItem)
                    ? kMainColor
                    : kTertiaryColor,
                width:
                    (MediaQuery.of(context).size.width -
                        (kHorizontalPadding * 2 +
                            kHorizontalPaddingS * _items.length -
                            1)) /
                    _items.length,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/themes.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currentIndex = 0;

  final List productImage = [
    'assets/images/img_shoes-1.png',
    'assets/images/img_shoes-2.png',
    'assets/images/img_shoes-3.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Dot Indicator For Product Images
    Widget sliderIndicator(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: currentIndex == index ? primaryColor : grayColor,
        ),
      );
    }

    // Header Widget (Header Button, Image Slider, Dot Indicator)
    Widget header() {
      int index = -1; // first index
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            // Header Button (Back and Cart)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: bgColor1,
                  ),
                ),
                Icon(
                  Icons.shopping_bag_rounded,
                  color: bgColor1,
                )
              ],
            ),
          ),
          // Image Carousel
          CarouselSlider(
            items: productImage
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: defaultMargin),
          // Dot Indicator Slider
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: productImage.map((e) {
              index++;
              return sliderIndicator(index);
            }).toList(),
          )
        ],
      );
    }

    // Boxed Content Widget
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(defaultRadius * 2), // 12 * 2
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Header (Product Name, Category, Wishlist Button)
            Row(
              children: [
                // Product Information, Category Product
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Terrex Urban Low'.toUpperCase(),
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semibold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Hiking',
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
                // Wishlist Button
                Image.asset(
                  'assets/icons/btn_wishlist-off.png',
                  width: 46,
                ),
              ],
            ),

            // Product Price Box
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, bottom: defaultMargin),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: bgColor2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price starts from', style: primaryTextStyle),
                  Text(
                    '\$143.98',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '''Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.''',
                    textAlign: TextAlign.justify,
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor6,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}

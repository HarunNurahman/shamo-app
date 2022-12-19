import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/themes.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';

class ProductPage extends StatefulWidget {
  ProductPage(this.product);

  final ProductModel product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Current index for product image slider
  int currentIndex = 0;

  // List for detail product image
  // final List productImage = [
  //   'assets/images/img_shoes-1.png',
  //   'assets/images/img_shoes-2.png',
  //   'assets/images/img_shoes-3.png',
  // ];

  // List for similar product
  final List similarProduct = [
    'assets/images/img_shoes-1.png',
    'assets/images/img_shoes-2.png',
    'assets/images/img_shoes-3.png',
    'assets/images/img_shoes-5.png',
    'assets/images/img_shoes-6.png',
    'assets/images/img_shoes-7.png',
    'assets/images/img_shoes-8.png',
  ];

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width - (2 * defaultMargin),
            child: AlertDialog(
              backgroundColor: bgColor3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultMargin),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    // Close Dialog Button
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                    // Success Icon
                    Image.asset(
                      'assets/icons/ic_success.png',
                      width: 100,
                    ),
                    const SizedBox(height: 12),
                    // Title
                    Text(
                      'Hurray :)',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semibold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Subtitle
                    Text(
                      'Item added successfully',
                      style: secondaryTextStyle,
                    ),
                    const SizedBox(height: 20),
                    // Go to Cart Button
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/cart');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: defaultRadius,
                          horizontal: 24,
                        ),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                      ),
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

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

    // Similar Product Slider
    Widget similarProductCard(String imgUrl) {
      return Container(
        margin: EdgeInsets.only(right: defaultRadius + 4), // 12 + 4
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
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
              top: 40,
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
            items: widget.product.galleries!
                .map(
                  (image) => Image.network(
                    image.url!,
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
            children: widget.product.galleries!.map((e) {
              index++;
              return sliderIndicator(index);
            }).toList(),
          )
        ],
      );
    }

    // Boxed Content Widget
    Widget content() {
      int index = -1;

      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
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
                        widget.product.name!.toUpperCase(),
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semibold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.product.category!.name!,
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
                // Wishlist Button
                GestureDetector(
                  onTap: () {
                    wishlistProvider.setProduct(widget.product);

                    if (wishlistProvider.isWishlisted(widget.product)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: secondaryColor,
                          content: Text(
                            'Item has been added to wishlist',
                            style: primaryTextStyle.copyWith(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: alertColor,
                          content: Text(
                            'Item has been removed to wishlist',
                            style: primaryTextStyle.copyWith(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  },
                  child: Image.asset(
                    wishlistProvider.isWishlisted(widget.product)
                        ? 'assets/icons/btn_wishlist-on.png'
                        : 'assets/icons/btn_wishlist-off.png',
                    width: 46,
                  ),
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
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  )
                ],
              ),
            ),

            // Description Section
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
                    widget.product.description!,
                    textAlign: TextAlign.justify,
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),

            // Similar Product
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Similar Products',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: defaultRadius),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: similarProduct.map((image) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 0 : 0,
                          ),
                          child: similarProductCard(image),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // Message and Add to Cart Button
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  // Message Button
                  Container(
                    margin: EdgeInsets.only(right: defaultRadius),
                    width: 54,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed('/message'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bgColor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          side: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Image.asset(
                        'assets/icons/ic_chat.png',
                        color: primaryColor,
                        width: 22,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showSuccessDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
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

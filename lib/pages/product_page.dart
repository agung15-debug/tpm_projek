import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png'
  ];

  int currentIndex = 0;

  final List familiarProducts = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: backgroundColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/icon_success.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Hurray :)',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Item added successfully',
                          style: secondaryTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 154,
                          height: 44,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'View My Cart',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
          width: currentIndex == index ? 16 : 4,
          height: 4,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: currentIndex == index ? primaryColor : Color(0xffc4c4c4),
            borderRadius: BorderRadius.circular(10),
          ));
    }

    Widget familiarProductsCard(String imageUrl) {
      return Container(
          width: 54,
          height: 54,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
            borderRadius: BorderRadius.circular(6),
          ));
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                Icon(Icons.shopping_bag, color: backgroundColor1),
              ],
            ),
          ),
          CarouselSlider(
              items: images
                  .map((image) => Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) => {
                  setState(() {
                    currentIndex = index;
                  })
                },
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(children: [
          //NOTE : HEADER
          Container(
            margin: EdgeInsets.only(
                top: defaultMargin, left: defaultMargin, right: defaultMargin),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TERREX URBAN LOW',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Hiking',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishlist = !isWishlist;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(isWishlist
                            ? 'Has been added to the Wishlist'
                            : 'Has been removed from the Wishlist'),
                        backgroundColor:
                            isWishlist ? secondaryColor : alertColor,
                      ));
                    },
                    child: Image.asset(
                      isWishlist
                          ? 'assets/button_wishlist_enable.png'
                          : 'assets/button_wishlist_disable.png',
                      width: 46,
                    ),
                  ),
                ]),
          ),

          //NOTE : PRICE
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'Price starts from',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                  Text(
                    'IDR 799.000',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ]),
          ),

          //NOTE : description
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: defaultMargin, left: defaultMargin, right: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),

          //NOTE : FAMILIAR PRODUCT
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Familiar Product',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: familiarProducts
                            .map((image) => familiarProductsCard(image))
                            .toList(),
                      ))
                ],
              )),
          //NOTE : BUTTONS
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: primaryColor),
                  ),
                  child: Image.asset(
                    'assets/button_chat.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 54,
                    child: TextButton(
                      onPressed: () {
                        showSuccessDialog();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor5,
        body: SafeArea(
          child: ListView(
            children: [header(), content()],
          ),
        ));
  }
}

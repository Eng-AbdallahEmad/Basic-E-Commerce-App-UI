import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/cart_dir_screen.dart';
import 'package:ecommerce/widgets/product_details_popup_screen.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Product Overview',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'UrbanistBold'
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: FanCarouselImageSlider.sliderType1(
                  imagesLink: images,
                  isAssets: true,
                  autoPlay: true,
                  sliderHeight: 350,
                  showIndicator: true,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'T-Shirt',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 25,
                                fontFamily: 'UrbanistBold',
                              ),
                            ),
                            Text(
                              'T-Shirt Child',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'UrbanistRegular'
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$300.00',
                          style: TextStyle(
                            color: Constant.primaryColor,
                            fontSize: 25,
                            fontFamily: 'UrbanistBold',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.only(right: 6),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        "Lorem Ipsum is simply dummy "
                            "of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontFamily: 'UrbanistRegular',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartDirScreen())
                );
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.black26.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            ProductDetailsPopUp(),
          ],
        ),
      ),
    );
  }
}

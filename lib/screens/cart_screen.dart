import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static List imageList = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
  ];

  static const List productTitle = [
    'T-Shirt',
    'Jacket',
    'Child Jacket',
    'Hooded'
  ];

  static const List price = [
    '\$300',
    '\$100',
    '\$600',
    '\$700',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      'Cart',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'UrbanistBold'
                      ),
                    ),
                  ),
                ),
                ...List.generate(productTitle.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          splashRadius: 20,
                          activeColor: Constant.primaryColor,
                          value: true,
                          onChanged: (val) {},
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imageList[index],
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productTitle[index],
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontFamily: 'UrbanistBold',
                                ),
                              ),
                              Text(
                                'Size: M',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontFamily: 'UrbanistRegular',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                price[index],
                                style: TextStyle(
                                  color: Constant.primaryColor,
                                  fontSize: 16,
                                  fontFamily: 'UrbanistBold',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.minus_circle,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '1',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'UrbanistBold',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              CupertinoIcons.plus_circle,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select All',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'UrbanistBold',
                              color: Colors.black87,
                            ),
                          ),
                          Checkbox(
                            splashRadius: 20,
                            activeColor: Constant.primaryColor,
                            value: true,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      const Divider(thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'UrbanistBold',
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '\$300.00',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'UrbanistBold',
                              color: Constant.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constant.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            // Checkout logic
                          },
                          child: const Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'UrbanistBold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

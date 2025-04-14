import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/payment_method_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartDirScreen extends StatelessWidget {
  const CartDirScreen({super.key});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'UrbanistBold',
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ...List.generate(productTitle.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
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
                SizedBox(width: 8),
                Checkbox(
                  value: false,
                  onChanged: null,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentMethodScreen()));
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

    );
  }
}

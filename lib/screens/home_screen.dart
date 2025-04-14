import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List tabs = ['All', 'Category', 'Top', 'Recommended'];

  static const List imageList = [
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

  static const List reviews = [
    '55',
    '666',
    '323',
    '88',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          hintText: 'Search Products...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'UrbanistRegular',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset('assets/images/freed.png'),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: tabs.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return tabsInfo(index);
                    }),
                ),
                SizedBox(height: 35,),
                Container(
                  height: 280,
                  color: Colors.transparent,
                  child: ListView.builder(
                    itemCount: imageList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return productsList(context, index);
                    },
                  ),
                ),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Newest Products',
                    style: TextStyle(
                      fontFamily: 'UrbanistBold',
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GridView.builder(
                    itemCount: productTitle.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index){
                      return productsList(context, index);
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabsInfo(int index) => FittedBox(
    child: Container(
      height: 40,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            tabs[index],
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'UrbanistBold',
            ),
          ),
        ),
      ),
    ),
  );
  
  Widget productsList(BuildContext context, int index) => Container(
    margin: const EdgeInsets.only(right: 15),
    width: 140,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductScreen()),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imageList[index],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Constant.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          productTitle[index],
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'UrbanistBold',
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 22,
                ),
                Text(
                  '(${reviews[index]})',
                  style: TextStyle(
                    fontFamily: 'UrbanistRegular',
                  ),
                ),
              ],
            ),
            Text(
              price[index],
              style: TextStyle(
                fontFamily: 'UrbanistBold',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

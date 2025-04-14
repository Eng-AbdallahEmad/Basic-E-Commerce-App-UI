import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/payment_successful_screen.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentMethodScreen> {
  int selectedPayment = 0;

  List<String> paymentTitles = [
    'Amazon Pay',
    'Credit Card',
    'PayPal',
    'Google Pay',
  ];

  List<String> paymentIcons = [
    'assets/images/amazon.png',
    'assets/images/credit.png',
    'assets/images/paypal.png',
    'assets/images/google.png',
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
          'Payment Method',
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ...List.generate(paymentTitles.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPayment = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedPayment == index ? Constant.primaryColor : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedPayment == index
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: selectedPayment == index ? Constant.primaryColor : Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        paymentTitles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'UrbanistBold',
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        paymentIcons[index],
                        width: 50,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              );
            }),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  summaryRow('Sub-Total', '\$1300.00'),
                  const SizedBox(height: 6),
                  summaryRow('Shipping Fee', '\$15.00'),
                  const Divider(height: 30, thickness: 1.2),
                  summaryRow('Total Payment', '\$1315.00',
                      valueColor: Colors.redAccent),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentSuccessfulScreen()
                            )
                        );
                      },
                      child: const Text(
                        'Confirm Payment',
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
    );
  }

  Widget summaryRow(String title, String value, {Color valueColor = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'UrbanistRegular',
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'UrbanistBold',
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
